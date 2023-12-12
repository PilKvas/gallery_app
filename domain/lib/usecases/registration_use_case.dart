part of '../domain.dart';

class RegistrationUseCase {
  final RegistrationRepository _repository;

  RegistrationUseCase({required RegistrationRepository repository}) : _repository = repository;

  Future<UserModel> registerUser({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    String? fullName,
    DateTime? birthday,
  }) {
    return _repository.registerUser(
      phoneNumber: phoneNumber,
      userName: userName,
      email: email,
      password: password,
      birthday: birthday,
      fullName: fullName,
    );
  }
}
