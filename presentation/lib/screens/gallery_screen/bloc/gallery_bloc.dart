part of '../gallery.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final FetchDataUseCase _fetchDataUseCase;

  GalleryBloc({required FetchDataUseCase fetchDataUseCase})
      : _fetchDataUseCase = fetchDataUseCase,
        super(GalleryState()) {
    on<_GalleryListLoaded>(
      (event, emit) async {

        if (state.status == Status.loading)return;

        var page = 1 + state.item.length ~/ 10;

        emit(
          state.copyWith(status: Status.loading, isPaginating: page != 1),
        );

        if (event.refresh) page = 1;

        final response = await _fetchDataUseCase.fetchGalleryData(
          isNew: event.isNew,
          page: page,
        );
        emit(
          state.copyWith(
            status: Status.success,
            item: event.refresh ? response.data : [...state.item, ...response.data],
          ),
        );
      },
    );
  }
}
