part of '../profile.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(UserModel()) UserModel? user,
    @Default(Status.initial) Status status,
    @Default(ErrorState.unknown) error,
  }) = _ProfileState;
}
