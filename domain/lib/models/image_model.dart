part of domain;


@freezed
class ImageGalleryModel with _$ImageGalleryModel {
  const factory ImageGalleryModel({
    ImageDetailsModel? image,
    required String name,
    required int id,
    required DateTime dateCreate,
    required String description,
    required bool isNew,
    required bool isPopular,
    String? user,
  }) = _ImageGalleryModel;
}
