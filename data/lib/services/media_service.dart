part of '../data.dart';

@RestApi()
abstract class MediaService {
  factory MediaService(Dio dio) = _MediaService;

  @POST('/api/media_objects')
  @MultiPart()
  Future<MediaDto> uploadMedia({
    @Part(name: 'file') required File filePath,
  });
}
