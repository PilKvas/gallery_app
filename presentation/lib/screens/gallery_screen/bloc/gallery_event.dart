part of '../gallery.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.loadGalleryList({
    @Default(AppConst.limit) int limit,
    int? id,
    bool? isNew,
    String? name,
    @Default(false) bool refresh,
  }) = _LoadGalleryList;
  const factory GalleryEvent.loadUserInfo() = _LoadUserInfo;
}
