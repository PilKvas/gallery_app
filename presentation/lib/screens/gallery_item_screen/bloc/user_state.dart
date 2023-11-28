part of '../gallery_item.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(Status.initial) Status status,
    UserEntity? item,
  }) = _UserState;
}
