part of '../gallery.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.galleryListLoaded({
    int? limit,
    int? id,
    bool? isNew,
    String? name,
    @Default(false) bool refresh,
  }) = _GalleryListLoaded;
  const factory GalleryEvent.loadUserInfo() = _LoadUserInfo;
}
