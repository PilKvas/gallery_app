part of '../domain.dart';


@freezed
class ImageDetailsModel with _$ImageDetailsModel {
  const factory ImageDetailsModel({
    required int id,
    required String name,
  }) = _ImageDetailsModel;
}
