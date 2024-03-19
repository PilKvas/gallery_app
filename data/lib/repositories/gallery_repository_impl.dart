part of '../data.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  final Mapper mapper = Mapper();
  final GalleryService _galleryService;

  GalleryRepositoryImpl({required GalleryService galleryService}) : _galleryService = galleryService;

  @override
  Future<PaginationWrapperModel<ImageGalleryModel>> getGallery({
    required int page,
    required int limit,
    bool? isNew,
    int? id,
    String? name,
  }) async {
    final galleryItems = await _galleryService.getGallery(
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

  @override
  Future<void> uploadImage({
    required String name,
    required String? description,
    required String imageIRI,
  }) async {
    final image = PhotoCreateRequestDto(
      name: name,
      description: description,
      isNew: false,
      isPopular: false,
      dateCreate: DateTime.now(),
      imageUri: imageIRI,
    );
    await _galleryService.uploadPhoto(request: image);
  }
}
