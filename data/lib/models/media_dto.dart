part of '../data.dart';

@freezed
class MediaDto with _$MediaDto {
  const factory MediaDto({
    @JsonKey(name: 'file') required String filePath,
    required int id,
    String? name,
  }) = _MediaDto;

  factory MediaDto.fromJson(Map<String, dynamic> json) => _$MediaDtoFromJson(json);
}
