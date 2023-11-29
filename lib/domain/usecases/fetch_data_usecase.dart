
import 'package:flutter_generating_practice/domain/models/image.dart';

import 'package:flutter_generating_practice/domain/repositories/gallery_repository.dart';

class FetchDataUseCase {
  final GalleryRepository _galleryRepository;

  FetchDataUseCase({required GalleryRepository galleryRepository}) : _galleryRepository = galleryRepository;

  Future<List<ImageGallery>> fetchGalleryData(){
    return _galleryRepository.getGallery();
  }
}
