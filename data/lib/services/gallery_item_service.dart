part of '../data.dart';



@RestApi()
abstract class GalleryDetailsService {
  factory GalleryDetailsService(Dio dio) = _GalleryDetailsService;

  @GET('/api/users/{id}')
  Future<UserDto> getUser({
    @Path('id') required int id,
  });
}
