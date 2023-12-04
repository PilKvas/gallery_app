part of '../domain.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String email,
    required bool enabled,
    required String username,
    String? phone,
    String? fullName,
    DateTime? birthDay,
    List<String>? roles,
  }) = _UserModel;
}
