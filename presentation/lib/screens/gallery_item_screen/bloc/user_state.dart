part of '../gallery_item.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    UserModel? item,
    @Default(Status.initial) Status status,
  }) = _UserState;
}
