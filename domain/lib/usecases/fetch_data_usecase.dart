part of domain;

class FetchDataUseCase {
  final GalleryRepository _galleryRepository;

  FetchDataUseCase({required GalleryRepository galleryRepository}) : _galleryRepository = galleryRepository;

  Future<PaginationWrapperModel<ImageGalleryModel>> fetchGalleryData({required bool isNew, required int page}){
    return _galleryRepository.getGallery(isNew: isNew, page: page);
  }
}
