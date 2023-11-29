part of domain;

abstract class GalleryRepository {
  Future<PaginationWrapperModel<ImageGalleryModel>> getGallery({required bool isNew, required int page});
}



