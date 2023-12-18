part of '../domain.dart';

abstract class UserRepository {
  Future<UserModel> registrateUser({
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
    String? fullName,
    DateTime? birthday,
  });

  Future<UserModel> getUserInfo({required int id});

  Future<UserModel> getCurrentUser();
}
