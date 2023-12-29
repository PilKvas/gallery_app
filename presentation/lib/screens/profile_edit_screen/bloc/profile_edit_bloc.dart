part of '../profile_edit.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UserUseCase userUseCase;
  final AuthenticationUseCase authUseCase;

  ProfileEditBloc({required this.userUseCase, required this.authUseCase}) : super(const ProfileEditState()) {
    on<_UpdateUserEvent>(
      _updateUser,
    );
    on<_SignOut>(
      _signOut,
    );
  }

  Future<void> _updateUser(
    _UpdateUserEvent event,
    Emitter<ProfileEditState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: Status.loading),
      );
      final error = <Fields, FieldsError>{
        ...?ValidationHelper.validateUserName(event.userName),
        ...?ValidationHelper.validatePhoneNumber(event.phoneNumber),
        ...?ValidationHelper.validateEmail(event.email),
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
        userName: event.userName,
        id: event.id,
        email: event.email,
        birthDay: event.birthDay,
        phoneNumber: event.phoneNumber,
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
