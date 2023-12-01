library presentation;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:presentation/presentation.dart';
import 'package:transparent_image/transparent_image.dart';

export 'generated/l10n.dart';
export 'routing/routing.dart';
export 'screens/gallery_item_screen/gallery_item.dart';
export 'screens/gallery_screen/gallery.dart';

part 'extensions/enum_status.dart';

part 'extensions/date_time_extension.dart';

part 'screens/gallery_item_screen/gallery_item_screen.dart';

part 'screens/gallery_item_screen/widgets/item_image.dart';

part 'screens/gallery_screen/gallery_screen.dart';

part 'screens/gallery_screen/widgets/media_list.dart';

part 'screens/home_screen/home_screen.dart';

part 'theme/app_colors.dart';

part 'theme/light_theme.dart';

part 'widgets/custom_progress_indicator.dart';

part 'widgets/no_internet_connection.dart';

part 'helpers/debouncer.dart';

part 'extensions/context_extension.dart';

part 'widgets/base_text_field.dart';

part 'screens/gallery_screen/widgets/grid_widget.dart';

part 'screens/gallery_screen/widgets/no_pictures_widget.dart';

part 'screens/gallery_screen/widgets/loading_widget.dart';

part 'screens/gallery_screen/widgets/pagination_loader_widget.dart';

part 'screens/gallery_item_screen/widgets/item_content.dart';
