part of '../data.dart';

@freezed
class ImageGalleryDTO with _$ImageGalleryDTO {
  const ImageGalleryDTO._();

  const factory ImageGalleryDTO({
     String? name,
     int? id,
     DateTime? dateCreate,
     String? description,
    @JsonKey(name: 'new')  bool? isNew,
    @JsonKey(name: 'popular')  bool? isPopular,
    ImageDetailsDTO? image,
    String? user,
  }) = _ImageGalleryDTO;

  factory ImageGalleryDTO.fromJson(Map<String, Object?> json) => _$ImageGalleryDTOFromJson(json);
}
