
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:data/data.dart';
import 'package:data/mapper/user_mapper.auto_mappr.dart';
import 'package:domain/domain.dart';

@AutoMappr([
  MapType<UserDto, UserModel>(),
])

class UserMappr extends $UserMappr {}

