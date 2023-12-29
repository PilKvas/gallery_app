part of '../data.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    int? id,
    String? email,
    bool? enabled,
    String? username,
    String? password,
    String? phone,
    String? fullName,
    @JsonKey(name: 'birthday') DateTime? birthDay,
    @Default([]) List<Role> roles,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic>  json) => _$UserDtoFromJson(json);
}
