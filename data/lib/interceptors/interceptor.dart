part of '../data.dart';

class MiddlewareInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.response?.statusCode) {
      case 400:
        final validationList = ValidationErrorHelps.getErrorList(err);
        handler.reject(
          BadRequest(validationError: validationList, requestOptions: err.requestOptions),
        );
      case 401:
        break;
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

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!(await ConnectivityHelper.hasConnection())) {
      return handler.reject(
        NoInternetConnection(requestOptions: options),
      );
    }

    return handler.next(options);
  }
}
