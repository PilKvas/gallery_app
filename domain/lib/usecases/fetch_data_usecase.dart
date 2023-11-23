part of domain;

class FetchDataUseCase {
  final GalleryRepository _galleryRepository;

  FetchDataUseCase({required GalleryRepository galleryRepository}) : _galleryRepository = galleryRepository;

  Future<PaginationWrapperEntity<ImageEntity>> fetchGalleryData({required bool isNew, required int page, required int limit}){
    return _galleryRepository.getGallery(isNew: isNew, page: page, limit: limit);
  }
}
