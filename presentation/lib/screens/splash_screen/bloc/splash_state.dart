part of '../splash.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(Status.initial) Status status,
    @Default(ErrorState.unknown) error,
})= _SplashState;
}
