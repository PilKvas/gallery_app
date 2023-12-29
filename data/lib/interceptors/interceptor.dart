part of '../data.dart';

class MiddlewareInterceptor extends Interceptor {
  final AuthenticationRepository _authenticationRepository;
  final SettingsRepository _storageRepository;

  MiddlewareInterceptor({
    required AuthenticationRepository authenticationRepository,
    required SettingsRepository storageRepository,
  })  : _storageRepository = storageRepository,
        _authenticationRepository = authenticationRepository;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    switch (err.response?.statusCode) {
      case 400:
        final validationList = ValidationErrorHelper.getErrorList(err);
        handler.reject(
          BadRequest(validationError: validationList, requestOptions: err.requestOptions),
        );
      case 401:
        await refreshToken(err.requestOptions, handler);
      case 403:
        handler.reject(Forbidden(requestOptions: err.requestOptions));
      case 404:
        handler.reject(NotFound(requestOptions: err.requestOptions));
      case 500 || 502:
        handler.reject(ServerUnavailable(requestOptions: err.requestOptions));
      case 503:
        handler.reject(ServiceTemporarilyUnavailable(requestOptions: err.requestOptions));
      default:
        handler.reject(UnknownError(requestOptions: err.requestOptions));
    }
  }

  Future<void> refreshToken(RequestOptions options, ErrorInterceptorHandler handler) async {
    await _storageRepository.deleteAccessToken();
    final refreshToken = await _storageRepository.getRefreshToken();

    if (refreshToken != null) {
      final response = await _authenticationRepository.refreshToken(
        refreshToken: refreshToken,
      );
      if (response != null) {
        await _storageRepository.saveTokens(model: response);

        options.headers['Authorization'] = 'Bearer ${response.accessToken}';

        final request = await Dio().fetch(options);

        return handler.resolve(request);
      }
    }

    return handler.reject(
      Unauthorized(requestOptions: options),
    );
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!(await ConnectivityHelper.hasConnection())) {
      return handler.reject(
        NoInternetConnection(requestOptions: options),
      );
    }
    final accessToken = await _storageRepository.getAccessToken();

    if (accessToken != null) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    }

    return handler.next(options);
  }
}
