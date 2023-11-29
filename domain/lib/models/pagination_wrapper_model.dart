part of '../domain.dart';

@Freezed(genericArgumentFactories: true)
class PaginationWrapperModel<T> with _$PaginationWrapperModel<T> {
  const factory PaginationWrapperModel({
    required int totalItems,
    required int itemsPerPage,
    required int countOfPages,
    @Default([]) List<T> data,
  }) = _PaginationWrapperModel;
}
