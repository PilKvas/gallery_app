library presentation;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:presentation/presentation.dart';
import 'package:transparent_image/transparent_image.dart';

export 'generated/l10n.dart';
export 'routing/routing.dart';
export 'screens/gallery_item_screen/gallery_item.dart';
export 'screens/gallery_screen/gallery.dart';
export 'screens/login_screen/login.dart';
export 'screens/profile_screen/profile.dart';
export 'screens/registration_screen/registration.dart';
export 'screens/splash_screen/splash.dart';
export 'screens/profile_edit_screen/profile_edit.dart';

part 'extensions/context_extension.dart';

part 'extensions/date_time_extension.dart';

part 'extensions/enum_extensions.dart';

part 'helpers/debouncer.dart';

part 'helpers/validation_helper.dart';

part 'screens/gallery_item_screen/gallery_item_screen.dart';

part 'screens/gallery_item_screen/widgets/item_content.dart';

part 'screens/gallery_item_screen/widgets/item_image.dart';

part 'screens/gallery_screen/gallery_screen.dart';

part 'screens/gallery_screen/widgets/grid_widget.dart';

part 'screens/gallery_screen/widgets/loading_widget.dart';

part 'screens/gallery_screen/widgets/media_list.dart';

part 'screens/gallery_screen/widgets/no_pictures_widget.dart';

part 'screens/gallery_screen/widgets/pagination_loader_widget.dart';

part 'screens/home_screen/home_screen.dart';

part 'screens/login_screen/login_screen.dart';

part 'screens/on_boarding_screen/on_boarding_screen.dart';

part 'screens/profile_screen/profile_screen.dart';

part 'screens/registration_screen/registration_screen.dart';

part 'widgets/base_app_bar.dart';

part 'screens/splash_screen/splash_screen.dart';

part 'theme/app_colors.dart';

part 'theme/light_theme.dart';

part 'widgets/base_snack_bar.dart';

part 'widgets/base_text_field.dart';

part 'widgets/custom_progress_indicator.dart';

part 'widgets/filled_button.dart';

part 'widgets/error_screen_widget.dart';

part 'widgets/outlined_button.dart';

part 'widgets/text_button.dart';

part 'screens/profile_edit_screen/profile_edit_screen.dart';

part 'widgets/base_scaffold.dart';
