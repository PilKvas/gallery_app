part of '../media.dart';

@freezed
class MediaEvent with _$MediaEvent {
  const factory MediaEvent.addMedia({
    required String name,
    String? description,
  }) = _AddMedia;


  const factory MediaEvent.pickImage({
    XFile? imageXFile,
  }) = _PickImage;


  const factory MediaEvent.closeImage() = _CloseImage;

}
