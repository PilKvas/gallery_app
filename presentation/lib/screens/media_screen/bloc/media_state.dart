part of '../media.dart';

@freezed
class MediaState with _$MediaState {
  const factory MediaState({
    @Default(Status.initial) Status status,
    @Default({}) Map<Fields, String Function(S localization)> fields,
    @Default(ErrorState.unknown) ErrorState error,
    String? name,
    String? description,
    File? imageFile,
  }) = _MediaState;
}
