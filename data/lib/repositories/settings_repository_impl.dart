part of '../data.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  SettingsRepositoryImpl({required FlutterSecureStorage secureStorage, required SharedPreferences sharedPreferences})
      : _secureStorage = secureStorage,
        _sharedPreferences = sharedPreferences;

  @override
  Future<String?> getRefreshToken() => _secureStorage.read(key: AppConst.refreshTokenStorageKey);

  @override
  Future<String?> getAccessToken() => _secureStorage.read(key: AppConst.accessTokenStorageKey);

  @override
  Future<void> saveTokens({required AuthenticationModel model}) async {
    await _secureStorage.write(key: AppConst.accessTokenStorageKey, value: model.accessToken);

    await _secureStorage.write(key: AppConst.refreshTokenStorageKey, value: model.refreshToken);
  }

  @override
  Future<void> deleteAccessToken() async {
    await _secureStorage.delete(key: AppConst.accessTokenStorageKey);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await _secureStorage.delete(key: AppConst.refreshTokenStorageKey);
  }

  @override
  Future<void> deleteAllTokens() async {
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> setIsFirstTimeInApp({required bool isFirstTimeInApp}) async {
    await _sharedPreferences.setBool(AppConst.key, isFirstTimeInApp);
  }

  @override
  Future<bool> getIsFirstTimeInApp() async {
    return _sharedPreferences.getBool(AppConst.key) ?? true;
  }
}
