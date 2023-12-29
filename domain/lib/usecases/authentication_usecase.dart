part of '../domain.dart';

class AuthenticationUseCase {
  final AuthenticationRepository _authRepository;
  final SettingsRepository _securityRepository;
  final UserRepository _userRepository;
  final CachedUserRepository _cachedUserRepository;

  AuthenticationUseCase({
    required UserRepository userRepository,
    required CachedUserRepository cachedUserRepository,
    required SettingsRepository securityStorage,
    required AuthenticationRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        _cachedUserRepository = cachedUserRepository,
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

    final user = await _userRepository.getCurrentUser();
    await _cachedUserRepository.saveUserData(userModel: user);

  }

  Future<AuthenticationModel?> refreshToken({
    required String refreshToken,
  }) async {
    return await _authRepository.refreshToken(
      refreshToken: refreshToken,
    );
  }

  Future<void> checkFirstTimeInApp() async {
    final firstTimeInApp = await _securityRepository.getIsFirstTimeInApp();

    if (firstTimeInApp) {
      await _securityRepository.deleteAllTokens();
      await _cachedUserRepository.deleteUserData();
      await _securityRepository.setIsFirstTimeInApp(isFirstTimeInApp: false);
    }
  }

  Future<void> logOut() async{
    await _securityRepository.deleteAllTokens();
    await _cachedUserRepository.deleteUserData();
  }
}
