part of '../domain.dart';

class UserUseCase {
  final UserRepository _galleryItemRepository;

  UserUseCase({
    required UserRepository galleryItemRepository,
  }) : _galleryItemRepository = galleryItemRepository;

  Future<UserModel> loadUserData({required String uri}) =>
      _galleryItemRepository.getUserInfo(id: int.parse(uri.split('/').last));

  Future<UserModel> getCurrentUser() => _galleryItemRepository.getCurrentUser();
}
