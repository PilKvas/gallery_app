part of data;

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryService service;

  GalleryRepositoryImpl({required this.service});

  @override
  Future<PaginationWrapperEntity<ImageEntity>> getGallery() async {
    final PaginationWrapperEntity<ImageGallery> galleryItems =
        await service.getGallery(isNew: true, page: 1, limit: 15);

    return PaginationWrapperEntity(
      totalItems: galleryItems.totalItems,
      itemsPerPage: galleryItems.itemsPerPage,
      countOfPages: galleryItems.countOfPages,
      data: galleryItems.data.map((item) => item.mapToEntity()).toList(),
    );
  }
}
