part of data;

class GalleryItemRepositoryImpl implements GalleryItemRepository {
  final GalleryDetailsService service;

  GalleryItemRepositoryImpl({required this.service});

  @override
  Future<UserEntity> getUserInfo({required int id}) async {
    final UserDto userInfo = await service.getGallery(id: id);
    return userInfo.mapToEntity();
  }
}
