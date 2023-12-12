part of '../domain.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    String? email,
    bool? enabled,
    String? username,
    String? password,
    String? phone,
    String? fullName,
    DateTime? birthDay,
    @Default([]) List<Role> roles,
  }) = _UserModel;
}
