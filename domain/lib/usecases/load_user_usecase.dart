part of domain;

class LoadUserUseCase {
  final GalleryItemRepository _galleryItemRepository;

  LoadUserUseCase({required GalleryItemRepository galleryItemRepository})
      : _galleryItemRepository = galleryItemRepository;

  Future<UserEntity> loadUserData({required String id}) {
    return _galleryItemRepository.getUserInfo(
      id: int.parse(
        id.replaceAll(RegExp('[^0-9]'), ''),
      ),
    );
  }
}
