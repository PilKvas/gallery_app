part of '../domain.dart';

class RegistrationUseCase {
  final UserRepository _repository;

  RegistrationUseCase({required UserRepository repository}) : _repository = repository;

  Future<UserModel> registerUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    String? fullName,
    DateTime? birthday,
  }) {
    return _repository.registrateUser(
      phoneNumber: phoneNumber,
      userName: userName,
      email: email,
      password: password,
      birthday: birthday,
      fullName: fullName,
    );
  }
}
