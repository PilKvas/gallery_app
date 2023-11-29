part of '../gallery_item.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoadUserUseCase _loadGalleryItemUseCase;

  UserBloc(this._loadGalleryItemUseCase) : super(const UserState()) {
    on<_UserEventLoaded>(
      _onLoadUser,
    );
  }

  Future<void> _onLoadUser(
    _UserEventLoaded event,
    Emitter<UserState> emit,
  ) async {
    emit(
      state.copyWith(status: Status.loading),
    );
    if (event.id == null) {
      return emit(state.copyWith(status: Status.success));
    }

    final response = await _loadGalleryItemUseCase.loadUserData(id: event.id!);
    emit(
      state.copyWith(
        status: Status.success,
        item: response,
      ),
    );
  }
}
