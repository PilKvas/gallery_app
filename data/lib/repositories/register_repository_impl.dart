part of '../data.dart';

class RegisterRepositoryImpl implements RegistrationRepository {
  final Mapper mapper = Mapper();
  final UserService service;

  RegisterRepositoryImpl({required this.service});

  @override
  Future<UserModel> registerUser({
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

    final user = await service.registerUser(request: userDto);

    return mapper.convert<UserDto, UserModel>(user);
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final user = await service.getCurrentUser();

    return mapper.convert<UserDto, UserModel>(user);
  }
}
