part of '../gallery.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState({
    String? name,
    @Default(Status.loading) Status status,
    @Default([]) List<ImageGalleryModel> item,
    @Default(0) int totalItems,
    @Default(false) bool isPaginating,
    @Default(false) bool hasReachedEnd,
  }) = _GalleryState;
}
