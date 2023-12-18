part of '../data.dart';

@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio) = _AuthenticationService;

  @GET('/oauth/v2/token')
  Future<AuthenticationDto> authenticateUser({
    @Queries() required RefreshToken request,
  });
}
