part of domain;




@freezed
class ImageEntity with _$ImageEntity {
  const factory ImageEntity({
    ImageDetails? image,
    String? name,
    required int id,
    required DateTime dateCreate,
    required String description,
    required bool isNew,
    required bool isPopular,
    String? user,
  }) = _ImageEntity;
}
