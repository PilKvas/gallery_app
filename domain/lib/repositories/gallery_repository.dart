part of domain;
abstract class GalleryRepository {
  Future<PaginationWrapperEntity<ImageEntity>> getGallery();
}

