part of '../profile_edit.dart';


class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default(Status.initial) Status status,
    @Default({}) Map<Fields, String Function(S localization)> fields,
    @Default(ErrorState.unknown) ErrorState error,
    String? userName,
    DateTime? birthDate,
    String? number,
    String? email,
    String? id,
  }) = _ProfileEditState;
}
