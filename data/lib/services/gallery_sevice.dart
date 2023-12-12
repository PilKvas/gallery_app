part of '../data.dart';

@RestApi()
abstract class GalleryService {
  factory GalleryService(Dio dio) = _GalleryService;

  @GET('/api/photos')
  Future<PaginationWrapper<ImageGalleryDTO>> getGallery({
    @Query('page') required int page,
    @Query('new') required bool isNew,
    @Default(AppConst.limit) @Query('limit') required int limit,
    @Query('name') String? name,
  });
}
