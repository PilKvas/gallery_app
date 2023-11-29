part of '../data.dart';

@RestApi()
abstract class GalleryService {
  factory GalleryService(Dio dio) = _GalleryService;

  @GET('/api/photos')
  Future<PaginationWrapper<ImageGalleryDTO>> getGallery({
    @Query('new') required bool isNew,
    @Query('page') required int page,
    @Query('name') String? name,
    @Query('limit') int limit = ApiConst.limit,
  });
}
