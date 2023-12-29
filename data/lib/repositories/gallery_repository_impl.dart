part of '../data.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final Mapper mapper = Mapper();
  final GalleryService service;

  GalleryRepositoryImpl({required this.service});

  @override
  Future<PaginationWrapperModel<ImageGalleryModel>> getGallery({
    required int page,
    required int limit,
    bool? isNew,
    int? id,
    String? name,
  }) async {
    final galleryItems = await service.getGallery(
      isNew: isNew,
      page: page,
      name: name,
      limit: limit,
      id: id,
    );

    return PaginationWrapperModel(
      totalItems: galleryItems.totalItems,
      itemsPerPage: galleryItems.itemsPerPage,
      countOfPages: galleryItems.countOfPages,
      data: mapper.convertList(galleryItems.data),
    );
  }
}
