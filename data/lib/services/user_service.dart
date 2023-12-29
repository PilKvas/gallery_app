part of '../data.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio) = _UserService;

  @POST('/api/users')
  Future<UserDto> registerUser({
    @Body(nullToAbsent: true) required UserDto request,
  });

  @GET('/api/users/current')
  Future<UserDto> getCurrentUser();

  @GET('/api/users/{id}')
  Future<UserDto> getUser({
    @Path('id') required int id,
  });

  @PUT('/api/users/{id}')
  Future<void> updateUser({
    @Path('id') required String id,
    @Body(nullToAbsent: true) required UserDto request,
  });
}
