part of data;

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required int id,
    required String email,
    required bool enabled,
    required String username,
    String? phone,
    String? fullName,
    DateTime? birthDay,
    List<String>? roles,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, Object?> json) => _$UserDtoFromJson(json);

  UserEntity mapToEntity() {
    return UserEntity(
      id: id,
      email: email,
      enabled: enabled,
      username: username,
      phone: phone,
      fullName: fullName,
      birthDay: birthDay,
      roles: roles,
    );
  }
}
