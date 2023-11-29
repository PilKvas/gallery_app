part of data;

class GalleryRepositoryImpl implements GalleryRepository {
  final ImageMapper mapper = ImageMapper();
  final GalleryService service;

  GalleryRepositoryImpl({required this.service});

  @override
  Future<PaginationWrapperModel<ImageGalleryModel>> getGallery({required bool isNew, required int page, String? name}) async {
    final PaginationWrapper<ImageGalleryDTO> galleryItems = await service.getGallery(isNew: isNew, page: page, name: name);

    return PaginationWrapperModel(
      totalItems: galleryItems.totalItems,
      itemsPerPage: galleryItems.itemsPerPage,
      countOfPages: galleryItems.countOfPages,
      data: mapper.convertList(galleryItems.data),
    );
  }
}
