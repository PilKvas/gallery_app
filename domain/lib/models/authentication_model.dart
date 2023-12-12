part of '../domain.dart';

@freezed
class AuthenticationModel with _$AuthenticationModel {
  const factory AuthenticationModel({
    required String accessToken,
    required int expiresIn,
    required String tokenType,
    required String refreshToken,
  }) = _AuthenticationModel;
}
