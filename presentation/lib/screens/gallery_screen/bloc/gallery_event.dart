part of '../gallery.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.galleryListLoaded({
    required bool isNew,
    @Default(false) bool refresh,
  }) = _GalleryListLoaded;
}
