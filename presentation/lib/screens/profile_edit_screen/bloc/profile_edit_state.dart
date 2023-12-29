part of '../profile_edit.dart';

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default(Status.initial) Status status,
    @Default({}) Map<Fields, String Function(S localization)> fields,
    @Default(ErrorState.unknown) error,
  }) = _ProfileEditState;
}
