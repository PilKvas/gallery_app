part of '../login.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(Status.initial) Status status,
    @Default({}) Map<Fields, String Function(S localization)> fields,
    @Default(ErrorState.unknown) error,
  }) = _AuthenticationState;
}
