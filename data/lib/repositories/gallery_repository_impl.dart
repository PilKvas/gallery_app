part of data;

class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryService service;

  GalleryRepositoryImpl({required this.service});

  @override
  Future<PaginationWrapperEntity<ImageEntity>> getGallery(
      {required bool isNew, required int limit, required int page}) async {
    final galleryItems =
        await service.getGallery(isNew: isNew, page: page, limit: limit);

    return PaginationWrapperEntity(
      totalItems: galleryItems.totalItems,
      itemsPerPage: galleryItems.itemsPerPage,
      countOfPages: galleryItems.countOfPages,
      data: galleryItems.data.map((item) => item.mapToEntity()).toList(),
    );
  }
}
