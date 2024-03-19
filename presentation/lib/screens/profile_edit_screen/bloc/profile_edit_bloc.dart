part of '../profile_edit.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UserUseCase userUseCase;
  final AuthenticationUseCase authUseCase;

  ProfileEditBloc({required this.userUseCase, required this.authUseCase}) : super(const ProfileEditState()) {
    on<_UpdateUserEvent>(
      _updateUserEvent,
    );
    on<_SignOut>(
      _signOut,
    );

    on<_Initialize>(
      _initialize,
    );

    on<_PickDate>(
      _pickDate,
    );

    on<_InputName>(
      _inputName,
    );

    on<_InputNumber>(
      _inputNumber,
    );
    on<_InputEmail>(
      _inputEmail,
    );
  }

  Future<void> _inputEmail(
    _InputEmail event,
    Emitter<ProfileEditState> emit,
  ) async {
    final initialErrors = {...state.fields}
      ..remove(Fields.emailField)
      ..addAll(
        {
          ...?ValidationHelper.validateEmail(event.email ?? AppConst.empty),
        }.map(
          (key, value) => MapEntry(key, value.getLocalizedTitle),
        ),
      );
    emit(
      state.copyWith(
        fields: initialErrors,
        email: event.email,
      ),
    );
  }

  Future<void> _inputNumber(
    _InputNumber event,
    Emitter<ProfileEditState> emit,
  ) async {
    final initialErrors = {...state.fields}
      ..remove(Fields.phoneNumberField)
      ..addAll(
        {
          ...?ValidationHelper.validatePhoneNumber(event.number ?? AppConst.empty),
        }.map(
          (key, value) => MapEntry(key, value.getLocalizedTitle),
        ),
      );

    emit(
      state.copyWith(
        fields: initialErrors,
        number: event.number,
      ),
    );
  }

  Future<void> _inputName(
    _InputName event,
    Emitter<ProfileEditState> emit,
  ) async {
    final initialErrors = {...state.fields}
      ..remove(Fields.userNameField)
      ..addAll(
        {
          ...?ValidationHelper.validateUserName(event.userName ?? AppConst.empty),
        }.map(
          (key, value) => MapEntry(key, value.getLocalizedTitle),
        ),
      );
    emit(state.copyWith(
      fields: initialErrors,
      userName: event.userName,
    ));
  }

  Future<void> _pickDate(
    _PickDate event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(
      state.copyWith(
        birthDate: event.birthDate,
      ),
    );
  }

  Future<void> _initialize(
    _Initialize event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    emit(
      state.copyWith(
        status: Status.success,
        userName: event.userName,
        email: event.email,
        number: event.phoneNumber,
        birthDate: event.birthDay,
      ),
    );
  }

  Future<void> _updateUserEvent(
    _UpdateUserEvent event,
    Emitter<ProfileEditState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: Status.loading),
      );
      final error = <Fields, FieldsError>{
        ...?ValidationHelper.validateUserName(state.userName ?? AppConst.empty),
        ...?ValidationHelper.validatePhoneNumber(state.number ?? AppConst.empty),
        ...?ValidationHelper.validateEmail(state.email ?? AppConst.empty),
      }.map(
        (key, value) => MapEntry(key, value.getLocalizedTitle),
      );
      if (error.isNotEmpty) {
        return emit(
          state.copyWith(
            status: Status.failure,
            fields: error,
            error: ErrorState.unknown,
          ),
        );
      }

      await userUseCase.updateUserInfo(
        userName: state.userName ?? AppConst.empty,
        id: event.id,
        email: state.email ?? AppConst.empty,
        birthDay: state.birthDate,
        phoneNumber: state.number ?? AppConst.empty,
      );

      emit(
        state.copyWith(
          fields: {},
          status: Status.success,
          error: ErrorState.unknown,
        ),
      );
    } on BadRequest catch (_) {
      emit(
        state.copyWith(
          error: ErrorState.badRequest,
        ),
      );
    } on ServerUnavailable catch (_) {
      emit(
        state.copyWith(
          error: ErrorState.serverUnavailable,
        ),
      );
    }
  }

  Future<void> _signOut(
    _SignOut event,
    Emitter<ProfileEditState> emit,
  ) async {
    await authUseCase.logOut();
  }
}
