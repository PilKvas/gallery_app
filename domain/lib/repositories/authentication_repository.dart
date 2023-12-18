part of '../domain.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationModel> authenticateUser({
    required String userName,
    required String password,
  });

  Future<AuthenticationModel>? refreshToken({
    required String refreshToken,
  });
}
