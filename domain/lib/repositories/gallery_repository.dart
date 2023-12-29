part of '../domain.dart';

abstract class GalleryRepository {
  Future<PaginationWrapperModel<ImageGalleryModel>> getGallery({
    required int page,
    required int limit,
    int? id,
    bool? isNew,
    String? name,
  });
}
