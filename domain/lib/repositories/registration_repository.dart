part of '../domain.dart';

abstract class RegistrationRepository {
  Future<UserModel> registerUser({
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
    String? fullName,
    DateTime? birthday,
  });
}
