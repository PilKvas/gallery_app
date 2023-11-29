part of '../data.dart';



@freezed
class ImageGalleryDTO with _$ImageGalleryDTO {
  const ImageGalleryDTO._();
  const factory ImageGalleryDTO({
    ImageDetailsDTO? image,
    required String name,
    required int id,
    required DateTime dateCreate,
    required String description,
    @JsonKey(name: 'new') required bool isNew,
    @JsonKey(name: 'popular') required bool isPopular,
    String? user,
  }) = _ImageGalleryDTO;
  factory ImageGalleryDTO.fromJson(Map<String, Object?> json) =>
      _$ImageGalleryDTOFromJson(json);
}
