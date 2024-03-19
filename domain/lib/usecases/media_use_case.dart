part of '../domain.dart';

class MediaUseCase {
  final MediaRepository _mediaRepository;
  final GalleryRepository _galleryRepository;

  MediaUseCase({
    required MediaRepository mediaRepository,
    required GalleryRepository galleryRepository,
  })  : _mediaRepository = mediaRepository,
        _galleryRepository = galleryRepository;

  Future<void> uploadImage({
    required File file,
    required String name,
    required String? description,
  }) async {
    final photo = await _mediaRepository.uploadMedia(file);

    await _galleryRepository.uploadImage(
      name: name,
      description: description,
      imageIRI: '/api/media_objects/${photo.id}',
    );
  }
}
