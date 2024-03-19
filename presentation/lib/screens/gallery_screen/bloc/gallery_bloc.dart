part of '../gallery.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryUseCase _galleryUseCase;

  GalleryBloc({
    required GalleryUseCase fetchDataUseCase,
  })  : _galleryUseCase = fetchDataUseCase,
        super(const GalleryState()) {
    on<_LoadGalleryList>(
      _onLoadGalleryList,
      transformer: droppable(),
    );
  }

  Future<void> _onLoadGalleryList(
    _LoadGalleryList event,
    Emitter<GalleryState> emit,
  ) async {
    try{
      if (state.hasReachedEnd && !event.refresh) return;

      var page = 1 + state.items.length ~/ event.limit;
      emit(
        state.copyWith(status: Status.loading, isPaginating: page != 1),
      );

      if (event.refresh) page = 1;

      final response = await _galleryUseCase.getGalleryData(
        id: event.id ?? state.id,
        isNew: event.isNew,
        page: page,
        name: event.name ?? state.name,
        limit: event.limit,
      );

      emit(
        state.copyWith(
          id: event.id ?? state.id,
          name: event.name ?? state.name,
          status: Status.success,
          hasReachedEnd: response.data.length < event.limit,
          items: event.refresh ? response.data : [...state.items, ...response.data],
        ),
      );
    } on BaseException catch (exception){
      return emit(
        state.copyWith(
          status: Status.failure,
          error: exception.errorStatus,
        ),
      );
    }

  }
}
