part of '../profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserUseCase userUseCase;

  ProfileBloc({
    required this.userUseCase,
  }) : super(const ProfileState()) {
    on<_loadUserData>(
      _onLoadUser,
    );
  }

  Future<void> _onLoadUser(
    _loadUserData event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(status: Status.loading),
    );

    final user = await userUseCase.getProfileData();

    emit(
      state.copyWith(
        status: Status.success,
        user: user,
      ),
    );
  }
}
