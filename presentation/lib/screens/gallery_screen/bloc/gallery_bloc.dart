part of '../gallery.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final FetchDataUseCase _fetchDataUseCase;

  GalleryBloc({required FetchDataUseCase fetchDataUseCase})
      : _fetchDataUseCase = fetchDataUseCase,
        super(const GalleryState()) {
    on<_GalleryListLoaded>(
      _onLoadImages,
      transformer: droppable(),
    );
  }

  Future<void> _onLoadImages(
    _GalleryListLoaded event,
    Emitter<GalleryState> emit,
  ) async {
    if (state.hasReachedEnd && !event.refresh) return;

    var page = 1 + state.items.length ~/ AppConst.limit;
    emit(
      state.copyWith(status: Status.loading, isPaginating: page != 1),
    );

    if (event.refresh) page = 1;

    final response = await _fetchDataUseCase.fetchGalleryData(
      isNew: event.isNew,
      page: page,
      name: event.name ?? state.name,
      limit: AppConst.limit,
    );

    emit(
      state.copyWith(
        name: event.name ?? state.name,
        status: Status.success,
        hasReachedEnd: response.data.length < AppConst.limit,
        items: event.refresh ? response.data : [...state.items, ...response.data],
      ),
    );
  }
}
