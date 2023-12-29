part of '../data.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Mapper mapper = Mapper();
  final AuthenticationService service;

  AuthenticationRepositoryImpl({required this.service});

  @override
  Future<AuthenticationModel> authenticateUser({
    String? userName,
    String? password,
    String? refreshToken,
  }) async {
    final item = await service.authenticateUser(
      request: RefreshToken(
        grantType: GrantType.password,
        username: userName,
        password: password,
        refreshToken: refreshToken,
      ),
    );

    return mapper.convert<AuthenticationDto, AuthenticationModel>(item);
  }

  @override
  Future<AuthenticationModel> refreshToken({required String refreshToken}) async {
    final item = await service.authenticateUser(
      request: RefreshToken(
        grantType: GrantType.refreshToken,
        refreshToken: refreshToken,
      ),
    );

    return mapper.convert<AuthenticationDto, AuthenticationModel>(item);
  }
}
