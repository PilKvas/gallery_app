part of '../registration.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.signUp({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
    DateTime? birthDay,
  }) = _SignUp;
}
