part of '../domain.dart';

class AuthenticationUseCase {
  final AuthenticationRepository _authRepository;
  final SettingsRepository _securityRepository;

  AuthenticationUseCase({
    required SettingsRepository securityStorage,
    required AuthenticationRepository authRepository,
  })  : _authRepository = authRepository,
        _securityRepository = securityStorage;

  Future<void> authenticateUser({
    required String userName,
    required String password,
  }) async {
    final response = await _authRepository.authenticateUser(
      userName: userName,
      password: password,
    );

    await _securityRepository.saveTokens(model: response);
  }

  Future<AuthenticationModel?> getRefreshModel({
    required String refreshToken,
  }) async {
    final response = await _authRepository.refreshToken(
      refreshToken: refreshToken,
    );

    return response;
  }

  Future<void> checkFirstTimeInApp() async {
    final firstTimeInApp = await _securityRepository.getIsFirstTimeInApp();

    if (firstTimeInApp) {
      await _securityRepository.deleteTokens();
      await _securityRepository.setIsFirstTimeInApp(isFirstTimeInApp: false);
    }
  }
}
