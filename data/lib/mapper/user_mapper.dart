
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

import 'user_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<UserDto, UserModel>(),
])

class UserMappr extends $UserMappr {}