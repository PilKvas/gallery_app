import 'package:flutter_generating_practice/domain/models/image.dart';

abstract class GalleryRepository {
  Future<List<ImageGallery>> getGallery();
}

