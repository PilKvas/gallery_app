part of domain;



@Freezed(genericArgumentFactories: true)
class PaginationWrapperEntity<T> with _$PaginationWrapperEntity<T> {
  const factory PaginationWrapperEntity({
    required final int totalItems,
    required final int itemsPerPage,
    required final int countOfPages,
    @Default([]) final List<T> data,
  }) = _PaginationWrapperEntity;
  factory PaginationWrapperEntity.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>_$PaginationWrapperEntityFromJson(json, fromJsonT);
}
