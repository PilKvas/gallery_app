part of core;

GetIt injection = GetIt.I;

Future<void> initializeDependencies() async {
  final dio = Dio(
    BaseOptions(baseUrl: AppConst.apiUrl)
  );

  final serviceGalleryList = GalleryService(dio);

  final serviceGalleryItem = GalleryDetailsService(dio);

  injection
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(
        service: serviceGalleryList,
      ),
    )
    ..registerLazySingleton<GalleryItemRepository>(
      () => GalleryItemRepositoryImpl(
        service: serviceGalleryItem,
      ),
    )
    ..registerLazySingleton<FetchDataUseCase>(
      () => FetchDataUseCase(
        galleryRepository: injection(),
      ),
    )
    ..registerLazySingleton<LoadUserUseCase>(
      () => LoadUserUseCase(
        galleryItemRepository: injection(),
      ),
    );
}
