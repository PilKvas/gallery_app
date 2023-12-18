part of '../domain.dart';

class GalleryUseCase {
  final GalleryRepository _galleryRepository;

  GalleryUseCase({
    required GalleryRepository galleryRepository,
  }) : _galleryRepository = galleryRepository;

  Future<PaginationWrapperModel<ImageGalleryModel>> getGalleryData({
    required bool isNew,
    required int page,
    required int limit,
    String? name,
  }) {
    return _galleryRepository.getGallery(
      isNew: isNew,
      page: page,
      name: name,
      limit: limit,
    );
  }
}
