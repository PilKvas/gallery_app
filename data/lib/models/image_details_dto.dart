part of '../data.dart';

@freezed
class ImageDetailsDTO with _$ImageDetailsDTO {
  const ImageDetailsDTO._();

  const factory ImageDetailsDTO({
    required int id,
    required String name,
  }) = _ImageDetails;

  factory ImageDetailsDTO.fromJson(Map<String, Object?> json) => _$ImageDetailsDTOFromJson(json);
}

