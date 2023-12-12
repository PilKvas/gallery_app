part of '../core.dart';

GetIt injection = GetIt.I;

Future<void> initializeDependencies() async {
  final dio = Dio(
    BaseOptions(baseUrl: AppConst.apiUrl),
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  final serviceGalleryList = GalleryService(dio);

  final serviceRegistration = UserService(dio);

  final serviceAuthentication = AuthenticationService(dio);

  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  injection
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(
        service: serviceGalleryList,
      ),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        service: serviceRegistration,
      ),
    )
    ..registerLazySingleton<FetchDataUseCase>(
      () => FetchDataUseCase(
        galleryRepository: injection(),
      ),
    )
    ..registerLazySingleton<UserUseCase>(
      () => UserUseCase(
        galleryItemRepository: injection(),
      ),
    )
    ..registerLazySingleton<RegistrationRepository>(
      () => RegisterRepositoryImpl(
        service: serviceRegistration,
      ),
    )
    ..registerLazySingleton<RegistrationUseCase>(
      () => RegistrationUseCase(
        repository: injection(),
      ),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        service: serviceAuthentication,
      ),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        secureStorage: storage,
        sharedPreferences: sharedPreferences,
      ),
    )
    ..registerLazySingleton<AuthenticationUseCase>(
      () => AuthenticationUseCase(
        authRepository: injection(),
        securityStorage: injection(),
      ),
    );

  dio.interceptors.add(
    MiddlewareInterceptor(
      storageRepository: injection(),
      authenticationRepository: injection(),
    ),
  );
}
