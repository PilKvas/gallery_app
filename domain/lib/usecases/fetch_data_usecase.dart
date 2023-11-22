part of domain;

class FetchDataUseCase {
  final GalleryRepository _galleryRepository;

  FetchDataUseCase({required GalleryRepository galleryRepository}) : _galleryRepository = galleryRepository;

  Future<PaginationWrapperEntity<ImageEntity>> fetchGalleryData(){
    return _galleryRepository.getGallery();
  }
}
