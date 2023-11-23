import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

GetIt injection = GetIt.I;

Future<void> initializeDependencies() async {
  final Dio dio = Dio();

  final service = GalleryService(dio);

  injection
    ..registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(service: service),
    )
    ..registerLazySingleton<FetchDataUseCase>(
      () => FetchDataUseCase(galleryRepository: injection()),
    );
}
