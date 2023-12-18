part of '../splash.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserUseCase _userUseCase;
  final AuthenticationUseCase _authenticationUseCase;

  SplashBloc({
    required UserUseCase userUseCase,
    required AuthenticationUseCase authenticationUseCase,
  })  : _userUseCase = userUseCase,
        _authenticationUseCase = authenticationUseCase,
        super(const SplashState()) {
    on<_StartApp>(
      _onStartApp,
    );
  }

  Future<void> _onStartApp(
    _StartApp event,
    Emitter<SplashState> emit,
  ) async {
    await _authenticationUseCase.checkFirstTimeInApp();
    try {
      emit(
        state.copyWith(
          status: Status.loading,
          error: ErrorState.unknown,
        ),
      );

      await _userUseCase.getCurrentUser();

      emit(
        state.copyWith(
          status: Status.success,
          error: ErrorState.unknown,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: Status.failure,
          error: ErrorState.unauthorized,
        ),
      );
    }
  }
}
