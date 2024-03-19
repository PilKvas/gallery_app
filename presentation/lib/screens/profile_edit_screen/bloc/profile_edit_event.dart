part of '../profile_edit.dart';

class ProfileEditEvent with _$ProfileEditEvent {
  const factory ProfileEditEvent.updateUser({
     required String id,
     String? userName,
     String? phoneNumber,
     String? email,
    DateTime? birthDay,
  }) = _UpdateUserEvent;

  const factory ProfileEditEvent.signOut() = _SignOut;

  const factory ProfileEditEvent.initialize({
    required String id,
    required String userName,
    required String phoneNumber,
    required String email,
    DateTime? birthDay,
  }) = _Initialize;

  const factory ProfileEditEvent.pickDate({
    DateTime? birthDate,
  }) = _PickDate;

  const factory ProfileEditEvent.inputName({
    String? userName,
  }) = _InputName;

  const factory ProfileEditEvent.inputNumber({
    String? number,
  }) = _InputNumber;

  const factory ProfileEditEvent.inputEmail({
    String? email,
  }) = _InputEmail;

  const factory ProfileEditEvent.inputBirthDay({
    String? birthDay,
  }) = _InputBirthDay;
}
