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
    ..registerLazySingleton<MediaService>(
      () => MediaService(dio),
    )
    ..registerLazySingleton<AuthenticationService>(
      () => AuthenticationService(dio),
    )
    ..registerLazySingleton<UserService>(
      () => UserService(dio),
    )
    ..registerLazySingleton<GalleryService>(
      () => GalleryService(dio),
    )
    ..registerLazySingleton<MediaRepository>(
      () => MediaRepositoryImpl(
        mediaService: injection(),
      ),
    )
    ..registerLazySingleton<CachedUserRepository>(
      () => CachedUserRepositoryImpl(
        secureStorage: storage,
      ),
    )
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(
        galleryService: injection(),
      ),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        service: injection(),
      ),
    )
    ..registerLazySingleton<MediaUseCase>(
      () => MediaUseCase(
        mediaRepository: injection(),
        galleryRepository: injection(),
      ),
    )
    ..registerLazySingleton<GalleryUseCase>(
      () => GalleryUseCase(
        galleryRepository: injection(),
      ),
    )
    ..registerLazySingleton<UserUseCase>(
      () => UserUseCase(
        userRepository: injection(),
        cachedUserRepository: injection(),
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
        userRepository: injection(),
        cachedUserRepository: injection(),
      ),
    );

  dio.interceptors.add(
    MiddlewareInterceptor(
      storageRepository: injection(),
      authenticationRepository: injection(),
    ),
  );
}
