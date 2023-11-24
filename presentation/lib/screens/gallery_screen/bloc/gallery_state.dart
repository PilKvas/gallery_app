part of '../gallery.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default(Status.initial) Status status,
    @Default([]) List<ImageEntity> item,
    @Default(0) int countOfPages,
    @Default(false) bool isPaginating,
  }) = _GalleryState;
}

