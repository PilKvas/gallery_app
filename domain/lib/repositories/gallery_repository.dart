part of '../domain.dart';

abstract class GalleryRepository {
  Future<PaginationWrapperModel<ImageGalleryModel>> getGallery({required bool isNew, required int page, required int limit, String? name});
}



