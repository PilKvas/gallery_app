part of '../data.dart';

@freezed
class AuthenticationDto with _$AuthenticationDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthenticationDto({
    required String accessToken,
    required int expiresIn,
    required String tokenType,
    required String refreshToken,
  }) = _AuthenticationDto;

  factory AuthenticationDto.fromJson(Map<String, Object?> json) => _$AuthenticationDtoFromJson(json);
}
