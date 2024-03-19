part of '../domain.dart';

abstract class CachedUserRepository {
  Future<void> deleteUserData();

  Future<void> saveUserData({required UserModel userModel});

  Future<UserModel?> getCachedCurrentUser();
}
