import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:data/data.dart';
import 'package:data/mapper/mapper.auto_mappr.dart';
import 'package:domain/domain.dart';


@AutoMappr([
  MapType<ImageGalleryDTO, ImageGalleryModel>(),
  MapType<ImageDetailsDTO, ImageDetailsModel>(),
  MapType<UserModel, UserDto>(),
  MapType<UserDto, UserModel>(),
  MapType<AuthenticationDto, AuthenticationModel>(),
])
class Mapper extends $Mapper {}
