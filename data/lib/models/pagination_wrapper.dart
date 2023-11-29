part of data;


@Freezed(genericArgumentFactories: true)
class PaginationWrapper<T> with _$PaginationWrapper<T> {
  const factory PaginationWrapper({
    required final int totalItems,
    required final int itemsPerPage,
    required final int countOfPages,
    @Default([]) final List<T> data,
  }) = _PaginationWrapper;


  factory PaginationWrapper.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) =>_$PaginationWrapperFromJson(json, fromJsonT);
}
