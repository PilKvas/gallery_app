part of '../domain.dart';

@freezed
class ImageGalleryModel with _$ImageGalleryModel {
  const factory ImageGalleryModel({
    required String name,
    required int id,
    required DateTime dateCreate,
    required String description,
    required bool isNew,
    required bool isPopular,
    ImageDetailsModel? image,
    String? user,
  }) = _ImageGalleryModel;
}
