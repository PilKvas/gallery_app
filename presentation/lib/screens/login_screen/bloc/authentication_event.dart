part of '../login.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.logIn({
    required String userName,
    required String password,
  }) = _LogIn;
}
