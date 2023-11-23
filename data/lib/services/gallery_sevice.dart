part of data;

@RestApi(baseUrl: 'https://gallery.prod1.webant.ru/api')
abstract class GalleryService {
  factory GalleryService(Dio dio) = _GalleryService;

  @GET('/photos')
  Future<PaginationWrapperEntity<ImageGalleryDTO>> getGallery({
    @Query('new') required bool isNew,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });
}
