part of '../data.dart';


@RestApi()
abstract class RegistrationService {
  factory RegistrationService(Dio dio) = _RegistrationService;

  @POST('/api/users')
  Future<UserDto> registerUser({
    @Body(nullToAbsent: true) required UserDto request,
  });
}
