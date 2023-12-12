part of '../registration.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(Status.initial) Status status,
    @Default({}) Map<Fields, String Function(S localization)> fields,
  }) = _RegistrationState;
}
