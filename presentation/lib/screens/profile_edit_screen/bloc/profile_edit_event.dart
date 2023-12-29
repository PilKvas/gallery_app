part of '../profile_edit.dart';

@freezed
class ProfileEditEvent with _$ProfileEditEvent {
  const factory ProfileEditEvent.updateUser({
    required String id,
    required String userName,
    required String phoneNumber,
    required String email,
    DateTime? birthDay,
  }) = _UpdateUserEvent;

  const factory ProfileEditEvent.signOut() = _SignOut;
}
