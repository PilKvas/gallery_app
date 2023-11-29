part of '../gallery_item.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.loadUser({
    String? id,
  }) = _UserEventLoaded;
}
