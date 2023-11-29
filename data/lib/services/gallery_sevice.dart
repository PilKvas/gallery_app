part of data;



@RestApi()
abstract class GalleryService {
  factory GalleryService(Dio dio) = _GalleryService;

  @GET('/api/photos')
  Future<PaginationWrapperEntity<ImageGalleryDTO>> getGallery({
    @Query('name') String? name,
    @Query('new') required bool isNew,
    @Query('page') required int page,
    @Query('limit') int limit = ApiConfig.limit,
  });
}
