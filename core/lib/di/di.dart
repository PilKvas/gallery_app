part of '../core.dart';

GetIt injection = GetIt.I;

Future<void> initializeDependencies() async {
  final dio = Dio(BaseOptions(baseUrl: AppConst.apiUrl));

  dio.interceptors.add(MiddlewareInterceptor());

  final serviceGalleryList = GalleryService(dio);

  final serviceGalleryItem = GalleryDetailsService(dio);

  final serviceRegistration = RegistrationService(dio);

  injection
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(
        service: serviceGalleryList,
      ),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        service: serviceGalleryItem,
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
      () => RegisterRepositoryImpl(service: serviceRegistration),
    )
    ..registerLazySingleton<RegistrationUseCase>(
      () => RegistrationUseCase(
        repository: injection(),
      ),
    );
}
