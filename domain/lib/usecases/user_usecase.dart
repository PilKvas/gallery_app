part of '../domain.dart';

class UserUseCase {
  final UserRepository _galleryItemRepository;

  UserUseCase({
    required UserRepository galleryItemRepository,
  }) : _galleryItemRepository = galleryItemRepository;

  Future<UserModel> loadUserData({required String id}) {
    return _galleryItemRepository.getUserInfo(
      id: int.parse(id.split('/').last),
    );
  }

  Future<UserModel> getCurrentUser() {
    return _galleryItemRepository.getCurrentUser();
  }
}
