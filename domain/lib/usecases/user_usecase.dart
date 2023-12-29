part of '../domain.dart';

class UserUseCase {
  final UserRepository _userRepository;
  final CachedUserRepository _cachedUserRepository;

  UserUseCase({
    required CachedUserRepository cachedUserRepository,
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        _cachedUserRepository = cachedUserRepository;

  Future<UserModel> loadUserData({required String uri}) =>
      _userRepository.getUserInfo(id: int.parse(uri.split('/').last));

  Future<UserModel> getCurrentUser() {
    return _userRepository.getCurrentUser();
  }

  Future<UserModel?> getProfileData() => _cachedUserRepository.getUserData();

  Future<void> updateUserInfo({
    required String id,
    required String email,
    required String userName,
    required String phoneNumber,
    DateTime? birthDay,
  }) {
    return _userRepository.updateUserInfo(
      id: id,
      email: email,
      userName: userName,
      phoneNumber: phoneNumber,
      birthDay: birthDay,
    );
  }
}
