part of '../gallery.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final FetchDataUseCase _galleryUseCase;

  GalleryBloc(this._galleryUseCase) : super(GalleryState()) {
    on<_GalleryListLoaded>((event, emit) async {
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );
      final response = await _galleryUseCase.fetchGalleryData();

      emit(
        state.copyWith(
          status: Status.success,
          item: response.data,
        ),
      );
    });
  }
}
