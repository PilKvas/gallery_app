part of '../gallery.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState({
    String? name,
    @Default(false) bool isPaginating,
    @Default(false) bool hasReachedEnd,
    @Default(Status.loading) Status status,
    @Default([]) List<ImageGalleryModel> items,
    @Default(ErrorState.unknown) ErrorState error,
    UserModel? user,
    int? id,
  }) = _GalleryState;
}
