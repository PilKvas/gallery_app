part of '../data.dart';

@freezed
class RefreshToken with _$RefreshToken {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RefreshToken({
    required GrantType? grantType,
    @JsonKey(includeIfNull: false) String? username,
    @JsonKey(includeIfNull: false) String? password,
    @JsonKey(includeIfNull: false) String? refreshToken,
    @Default(AppConst.clientSecret) String? clientSecret,
    @Default(AppConst.clientId) String? clientId,
  }) = _RefreshToken;

  factory RefreshToken.fromJson(Map<String, dynamic> json) => _$RefreshTokenFromJson(json);
}
