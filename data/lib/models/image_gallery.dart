part of data;

@freezed
class ImageGallery with _$ImageGallery {
  const ImageGallery._();
  const factory ImageGallery({
    required ImageDetailsDTO image,
    required String name,
    required int id,
    required String dateCreate,
    required String description,
    @JsonKey(name: 'new') required bool isNew,
    @JsonKey(name: 'popular') required bool isPopular,
    required String user,
  }) = _ImageGallery;
  factory ImageGallery.fromJson(Map<String, Object?> json) =>
      _$ImageGalleryFromJson(json);

  ImageEntity mapToEntity() {
    return ImageEntity(
      image: image.mapToEntity(),
      name: name,
      id: id,
      dateCreate: dateCreate,
      description: description,
      isNew: isNew,
      isPopular: isPopular,
      user: user,
    );
  }
}
