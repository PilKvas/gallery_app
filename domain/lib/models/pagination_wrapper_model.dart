part of domain;


@Freezed(genericArgumentFactories: true)
class PaginationWrapperModel<T> with _$PaginationWrapperModel<T> {
  const factory PaginationWrapperModel({
    required final int totalItems,
    required final int itemsPerPage,
    required final int countOfPages,
    @Default([]) final List<T> data,
  }) = _PaginationWrapperModel;

}
