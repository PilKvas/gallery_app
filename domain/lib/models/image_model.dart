part of '../domain.dart';

@freezed
class ImageGalleryModel with _$ImageGalleryModel {
  const factory ImageGalleryModel({
    required int id,
    required bool isNew,
    required String name,
    required bool isPopular,
    required String description,
    required DateTime dateCreate,
    ImageDetailsModel? image,
    String? user,
  }) = _ImageGalleryModel;
}
