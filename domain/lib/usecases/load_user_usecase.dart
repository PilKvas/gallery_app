part of '../domain.dart';

class LoadUserUseCase {
  final UserRepository _galleryItemRepository;

  LoadUserUseCase({required UserRepository galleryItemRepository})
      : _galleryItemRepository = galleryItemRepository;

  Future<UserModel> loadUserData({required String id}) {
    return _galleryItemRepository.getUserInfo(
      id: int.parse(
        id.split('/').last
      ),
    );
  }
}
