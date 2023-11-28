part of domain;

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String email,
    required bool enabled,
    required String username,
    String? phone,
    String? fullName,
    DateTime? birthDay,
    List<String>? roles,
  }) = _UserEntity;
}