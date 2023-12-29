part of '../domain.dart';

abstract class UserRepository {
  Future<void> registerUser({
    required String email,
    required String userName,
    required String password,
    required String phoneNumber,
    String? fullName,
    DateTime? birthday,
  });

  Future<UserModel> getUserInfo({required int id});

  Future<UserModel> getCurrentUser();

  Future<void> updateUserInfo({
    required String id,
    required String email,
    required String userName,
    required String phoneNumber,
    DateTime? birthDay,
  });
}
