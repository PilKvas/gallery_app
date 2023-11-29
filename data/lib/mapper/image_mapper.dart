import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

import 'image_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<ImageGalleryDTO, ImageGalleryModel>(),
  MapType<ImageDetailsDTO, ImageDetailsModel>(),
])
class ImageMapper extends $ImageMapper {}
