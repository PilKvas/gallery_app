part of '../domain.dart';

@freezed
class MediaModel with _$MediaModel {
  const factory MediaModel({
    required String filePath,
    required int id,
    String? name,
  }) = _MediaModel;
}
