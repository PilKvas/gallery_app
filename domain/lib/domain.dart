library domain;

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

part 'usecases/user_usecase.dart';

part 'usecases/registration_use_case.dart';

part 'repositories/authentication_repository.dart';

part 'models/authentication_model.dart';

part 'usecases/authentication_usecase.dart';

part 'repositories/settings_repository.dart';
