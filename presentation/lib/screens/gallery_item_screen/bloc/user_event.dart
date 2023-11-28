part of '../gallery_item.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.galleryItemLoaded({
    String? id,
    @Default(false) bool refresh,
  }) = _UserEventLoaded;
}
