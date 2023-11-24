part of domain;


@freezed
class ImageEntity with _$ImageEntity {
  const factory ImageEntity({
    ImageDetails? image,
    required String name,
    required int id,
    required String dateCreate,
    required String description,
    required bool isNew,
    required bool isPopular,
    @Default('')  String user,
  }) = _ImageEntity;
}
