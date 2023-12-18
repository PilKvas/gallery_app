part of '../registration.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationUseCase _registerUseCase;

  RegistrationBloc({required RegistrationUseCase register})
      : _registerUseCase = register,
        super(const RegistrationState()) {
    on<_SignUp>(
      _onRegisterUser,
    );
  }

  Future<void> _onRegisterUser(
    _SignUp event,
    Emitter<RegistrationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: Status.loading),
      );

      final error = <Fields, FieldsError>{
        ...?ValidationHelper.validateUserName(event.userName),
        ...?ValidationHelper.validatePhoneNumber(event.phoneNumber),
        ...?ValidationHelper.validateEmail(event.email),
        ...?ValidationHelper.validatePassword(event.password),
        ...?ValidationHelper.isConfirmedPassword(event.password, event.confirmPassword),
      }.map((key, value) => MapEntry(key, value.getLocalizedTitle));

      if (error.isNotEmpty) {
        emit(
          state.copyWith(
            status: Status.failure,
            fields: error,
          ),
        );

        return;
      }

      await _registerUseCase.registerUser(
        phoneNumber: event.phoneNumber,
        userName: event.userName,
        email: event.email,
        password: event.password,
        birthday: event.birthDay,
      );

      emit(
        state.copyWith(
          status: Status.success,
          fields: {},
        ),
      );
    } on BadRequest catch (badRequest) {
      final map = badRequest.validationError?.map(
        (error) => MapEntry(Fields.fromString(error.propertyPath), (_) => error.message),
      );

      emit(
        state.copyWith(
          status: Status.failure,
          fields: Map<Fields, String Function(S)>.fromEntries(map!),
        ),
      );
    }
  }
}
