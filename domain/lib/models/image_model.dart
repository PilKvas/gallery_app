part of '../domain.dart';

@freezed
class ImageGalleryModel with _$ImageGalleryModel {
  const factory ImageGalleryModel({
     int? id,
     bool? isNew,
     String? name,
     bool? isPopular,
     String? description,
     DateTime? dateCreate,
    ImageDetailsModel? image,
    String? user,
  }) = _ImageGalleryModel;
}
