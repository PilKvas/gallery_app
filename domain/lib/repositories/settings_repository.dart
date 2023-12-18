part of '../domain.dart';

abstract class SettingsRepository {
  Future<void> saveTokens({required AuthenticationModel model});

  Future<void> deleteTokens();

  Future<String?> getRefreshToken();

  Future<String?> getAccessToken();

  Future<bool> getIsFirstTimeInApp();

  Future<void> setIsFirstTimeInApp({required bool isFirstTimeInApp});
}
