part of '../data.dart';


@freezed
class PhotoCreateRequestDto with _$PhotoCreateRequestDto {
  const factory PhotoCreateRequestDto({
    @JsonKey(includeIfNull: false) String? name,
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(includeIfNull: false) DateTime? dateCreate,
    @JsonKey(includeIfNull: false) String? description,
    @JsonKey(name: 'new', includeIfNull: false) bool? isNew,
    @JsonKey(name: 'popular', includeIfNull: false) bool? isPopular,
    @JsonKey(name: 'image', includeIfNull: false) String? imageUri,
    @JsonKey(includeIfNull: false) String? user,
  }) = _PhotoCreateRequestDto;

  factory PhotoCreateRequestDto.fromJson(Map<String, dynamic> json) => _$PhotoCreateRequestDtoFromJson(json);
}
