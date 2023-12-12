part of '../domain.dart';

class FetchDataUseCase {
  final GalleryRepository _galleryRepository;

  FetchDataUseCase({
    required GalleryRepository galleryRepository,
  }) : _galleryRepository = galleryRepository;

  Future<PaginationWrapperModel<ImageGalleryModel>> fetchGalleryData({
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
