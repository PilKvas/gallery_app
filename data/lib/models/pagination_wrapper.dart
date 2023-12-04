part of '../data.dart';

@Freezed(genericArgumentFactories: true)
class PaginationWrapper<T> with _$PaginationWrapper<T> {
  const factory PaginationWrapper({
    required int totalItems,
    required int itemsPerPage,
    required int countOfPages,
    @Default([]) List<T> data,
  }) = _PaginationWrapper;

  factory PaginationWrapper.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationWrapperFromJson(json, fromJsonT);
}
