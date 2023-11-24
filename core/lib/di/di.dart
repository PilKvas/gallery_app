part of core;

GetIt injection = GetIt.I;

Future<void> initializeDependencies() async {
  final dio = Dio();

  final service = GalleryService(dio);

  injection
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(service: service),
    )
    ..registerLazySingleton<FetchDataUseCase>(
      () => FetchDataUseCase(galleryRepository: injection()),
    );
}
