part of '../data.dart';

class MediaRepositoryImpl implements MediaRepository {
  final Mapper mapper = Mapper();
  final MediaService _mediaService;

  MediaRepositoryImpl({
    required MediaService mediaService,
  }) : _mediaService = mediaService;

  @override
  Future<MediaModel> uploadMedia(
    File filePath,
  ) async {
    final response = await _mediaService.uploadMedia(filePath: filePath);

    return mapper.convert<MediaDto, MediaModel>(response);
  }
}
