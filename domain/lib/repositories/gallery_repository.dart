part of '../domain.dart';

abstract class GalleryRepository {
  Future<PaginationWrapperModel<ImageGalleryModel>> getGallery({required bool isNew, required int page, String? name});
}



