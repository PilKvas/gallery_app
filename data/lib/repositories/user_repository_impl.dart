part of '../data.dart';

class UserRepositoryImpl implements UserRepository {
  final Mapper mapper = Mapper();
  final UserService service;

  UserRepositoryImpl({required this.service});

  @override
  Future<UserModel> getUserInfo({required int id}) async {
    final userInfo = await service.getUser(id: id);
    return mapper.convert<UserDto, UserModel>(userInfo);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final currentUser = await service.getCurrentUser();

    return mapper.convert<UserDto, UserModel>(currentUser);
  }

  @override
  Future<void> registerUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    String? fullName,
    DateTime? birthday,
  }) async {
    final userDto = UserDto(
      username: userName,
      email: email,
      password: password,
      fullName: fullName,
      birthDay: birthday,
      phone: phoneNumber,
    );

    await service.registerUser(request: userDto);
  }

  @override
  Future<void> updateUserInfo({
    required String id,
    required String email,
    required String userName,
    required String phoneNumber,
    DateTime? birthDay,
  }) async {
    final userDto = UserDto(
      username: userName,
      email: email,
      birthDay: birthDay,
      phone: phoneNumber,
    );
    await service.updateUser(id: id, request: userDto);
  }
}
