part of '../login.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationUseCase authUseCase;

  AuthenticationBloc({
    required this.authUseCase,
  }) : super(const AuthenticationState()) {
    on<_LogIn>(_onAuthenticate);
  }

  Future<void> _onAuthenticate(
    _LogIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: Status.loading),
      );
      final error = <Fields, FieldsError>{
        ...?ValidationHelper.validateUserName(event.userName),
        ...?ValidationHelper.validatePassword(event.password),
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

      await authUseCase.authenticateUser(
        userName: event.userName,
        password: event.password,
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
    }
  }
}
