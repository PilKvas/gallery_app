part of '../data.dart';

@freezed
class RefreshToken with _$RefreshToken {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RefreshToken({
    required GrantType? grantType,
    String? userName,
    String? password,
    String? refreshToken,
    @Default(AppConst.clientSecret) String? clientSecret,
    @Default(AppConst.clientId) String? clientId,
}) = _RefreshToken;

  factory RefreshToken.fromJson(Map<String, dynamic> json) => _$RefreshTokenFromJson(json);
}
