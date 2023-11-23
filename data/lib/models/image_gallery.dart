part of data;

@freezed
class ImageGalleryDTO with _$ImageGalleryDTO {
  const ImageGalleryDTO._();
  const factory ImageGalleryDTO({
    required ImageDetailsDTO image,
    required String name,
    required int id,
    required String dateCreate,
    required String description,
    @JsonKey(name: 'new') required bool isNew,
    @JsonKey(name: 'popular') required bool isPopular,
    required String user,
  }) = _ImageGalleryDTO;
  factory ImageGalleryDTO.fromJson(Map<String, Object?> json) =>
      _$ImageGalleryDTOFromJson(json);

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
