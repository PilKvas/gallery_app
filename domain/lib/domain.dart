library domain;

import 'dart:io';

import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain.freezed.dart';

part 'models/image_details_model.dart';

part 'models/image_model.dart';

part 'models/pagination_wrapper_model.dart';

part 'models/user_model.dart';

part 'repositories/user_repository.dart';

part 'repositories/gallery_repository.dart';

part 'usecases/gallery_use_cse.dart';

part 'usecases/user_use_case.dart';

part 'usecases/registration_use_case.dart';

part 'repositories/authentication_repository.dart';

part 'models/authentication_model.dart';

part 'usecases/authentication_use_case.dart';

part 'repositories/settings_repository.dart';

part 'repositories/cached_user_repository.dart';

part 'models/media_model.dart';

part 'repositories/media_repository.dart';

part 'usecases/media_use_case.dart';


