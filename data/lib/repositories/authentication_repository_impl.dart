part of '../data.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Mapper mapper = Mapper();
  final AuthenticationService service;

  AuthenticationRepositoryImpl({required this.service});

  @override
  Future<AuthenticationModel> authenticateUser({
    String? userName,
    String? password,
    String? grandType,
    String? refreshToken,
  }) async {
    final item = await service.authenticateUser(
      userName: userName,
      password: password,
      grantType: GrantType.password,
    );

    return mapper.convert<AuthenticationDto, AuthenticationModel>(item);
  }

  @override
  Future<AuthenticationModel> refreshToken({required String refreshToken}) async {
    final item = await service.authenticateUser(
      refreshToken: refreshToken,
      grantType: GrantType.refreshToken,
    );

    return mapper.convert<AuthenticationDto, AuthenticationModel>(item);
  }
}
