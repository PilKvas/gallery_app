part of '../domain.dart';

class GalleryUseCase {
  final GalleryRepository _galleryRepository;
  GalleryUseCase({
    required GalleryRepository galleryRepository,
  }) : _galleryRepository = galleryRepository;

  Future<PaginationWrapperModel<ImageGalleryModel>> getGalleryData({
    required int page,
    required int limit,
    int? id,
    bool? isNew,
    String? name,
  }) async {

    return _galleryRepository.getGallery(
      id: id,
      isNew: isNew,
      page: page,
      name: name,
      limit: limit,
    );
  }
}
