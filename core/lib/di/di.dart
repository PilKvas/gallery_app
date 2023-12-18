part of '../core.dart';

GetIt injection = GetIt.I;

Future<void> initializeDependencies() async {
  final dio = Dio(
    BaseOptions(baseUrl: AppConst.apiUrl),
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  injection
    ..registerLazySingleton<AuthenticationService>(
      () => AuthenticationService(dio),
    )
    ..registerLazySingleton<UserService>(
      () => UserService(dio),
    )
    ..registerLazySingleton<GalleryService>(
      () => GalleryService(dio),
    )
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(
        service: injection(),
      ),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        service: injection(),
      ),
    )
    ..registerLazySingleton<GalleryUseCase>(
      () => GalleryUseCase(
        galleryRepository: injection(),
      ),
    )
    ..registerLazySingleton<UserUseCase>(
      () => UserUseCase(
        galleryItemRepository: injection(),
      ),
    )
    ..registerLazySingleton<RegistrationUseCase>(
      () => RegistrationUseCase(
        repository: injection(),
      ),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        service: injection(),
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
