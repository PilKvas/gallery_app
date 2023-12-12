part of '../data.dart';

@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio) = _AuthenticationService;

  @GET('/oauth/v2/token')
  Future<AuthenticationDto> authenticateUser({
    @Query('grant_type') required GrantType grantType,
    @Query('username') String? userName,
    @Query('password') String? password,
    @Query('refresh_token') String? refreshToken,
    @Query('client_secret') String? clientSecret = AppConst.clientSecret,
    @Query('client_id') String? clientId = AppConst.clientId,
  });
}
