part of domain;
abstract class GalleryRepository {
  Future<PaginationWrapperEntity<ImageEntity>> getGallery({required bool isNew, required int page});
}

