library data;


import 'package:data/mapper/image_mapper.dart';

import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'mapper/user_mapper.dart';

export 'mapper/user_mapper.dart';

part 'data.freezed.dart';

part 'data.g.dart';

part 'models/image_details_dto.dart';

part 'models/image_gallery_dto.dart';

part 'models/user_dto.dart';

part 'repositories/gallery_repository_impl.dart';

part 'services/gallery_item_service.dart';

part 'services/gallery_sevice.dart';

part 'repositories/gallery_item_repository_impl.dart';

part 'models/pagination_wrapper.dart';

part 'resources/api_config.dart';