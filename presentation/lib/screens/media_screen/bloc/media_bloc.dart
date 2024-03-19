part of '../media.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final MediaUseCase mediaUseCase;

  MediaBloc({required this.mediaUseCase}) : super(const MediaState()) {
    on<_AddMedia>(_onAddMedia);
    on<_PickImage>(_onPickImage);
    on<_CloseImage>(_onCloseImage);
  }

  Future<void> _onCloseImage(
    _CloseImage event,
    Emitter<MediaState> emit,
  ) async {
    emit(
      state.copyWith(
        imageFile: null,
      ),
    );
  }

  Future<void> _onPickImage(
    _PickImage event,
    Emitter<MediaState> emit,
  ) async {
    if (event.imageXFile != null) {
      emit(
        state.copyWith(
          imageFile: File(event.imageXFile!.path),
        ),
      );
    }
  }

  Future<void> _onAddMedia(
    _AddMedia event,
    Emitter<MediaState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: Status.loading),
      );
      final error = <Fields, FieldsError>{
        ...?ValidationHelper.validateName(event.name),
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

      await mediaUseCase.uploadImage(
        name: event.name,
        description: event.description,
        file: state.imageFile!,
      );

      emit(
        state.copyWith(
          status: Status.success,
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
}
