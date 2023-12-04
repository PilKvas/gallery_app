import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:data/data.dart';
import 'package:data/mapper/image_mapper.auto_mappr.dart';
import 'package:domain/domain.dart';

@AutoMappr([
  MapType<ImageGalleryDTO, ImageGalleryModel>(),
  MapType<ImageDetailsDTO, ImageDetailsModel>(),
])
class ImageMapper extends $ImageMapper {}
