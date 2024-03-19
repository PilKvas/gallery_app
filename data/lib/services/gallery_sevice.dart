part of '../data.dart';

@RestApi()
abstract class GalleryService {
  factory GalleryService(Dio dio) = _GalleryService;

  @GET('/api/photos')
  Future<PaginationWrapper<ImageGalleryDTO>> getGallery({
    @Default(AppConst.limit) @Query('limit') required int limit,
    @Query('page') required int page,
    @Query('new') bool? isNew,
    @Query('name') String? name,
    @Query('user.id') int? id,
  });

  @POST('/api/photos')
  Future<ImageGalleryDTO> uploadPhoto({
    @Body() required PhotoCreateRequestDto request,
  });
}
