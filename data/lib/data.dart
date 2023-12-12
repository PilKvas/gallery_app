library data;

import 'dart:convert';
import 'dart:io';

import 'package:core/core.dart';
import 'package:data/mapper/mapper.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'data.freezed.dart';

part 'data.g.dart';

part 'exeptions/exeptions.dart';

part 'helpers/connectivity_hepler.dart';

part 'helpers/validation_error_helper.dart';

part 'interceptors/interceptor.dart';

part 'models/image_details_dto.dart';

part 'models/image_gallery_dto.dart';

part 'models/pagination_wrapper.dart';

part 'models/user_dto.dart';

part 'models/validation_error.dart';

part 'repositories/gallery_item_repository_impl.dart';

part 'repositories/gallery_repository_impl.dart';

part 'repositories/register_repository_impl.dart';

part 'services/gallery_sevice.dart';

part 'services/user_service.dart';

part 'models/authentication_dto.dart';

part 'repositories/authentication_repository_impl.dart';

part 'services/authentication_service.dart';

part 'repositories/security_storage_impl.dart';
