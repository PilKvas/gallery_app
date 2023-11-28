part of data;


@RestApi()
abstract class GalleryDetailsService {
  factory GalleryDetailsService(Dio dio) = _GalleryDetailsService;

  @GET('/api/users/{id}')
  Future<UserDto> getGallery({
    @Path('id') required int id,
  });
}
