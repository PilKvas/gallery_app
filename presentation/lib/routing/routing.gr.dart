// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routing.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GalleryItemRoute.name: (routeData) {
      final args = routeData.argsAs<GalleryItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: GalleryItemScreen(
          imageInfo: args.imageInfo,
          key: args.key,
        )),
      );
    },
    GalleryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GalleryScreen(),
      );
    },
    GalleryStackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GalleryStackScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const RegistrationScreen()),
      );
    },
  };
}

/// generated route for
/// [GalleryItemScreen]
class GalleryItemRoute extends PageRouteInfo<GalleryItemRouteArgs> {
  GalleryItemRoute({
    required ImageGalleryModel imageInfo,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GalleryItemRoute.name,
          args: GalleryItemRouteArgs(
            imageInfo: imageInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GalleryItemRoute';

  static const PageInfo<GalleryItemRouteArgs> page = PageInfo<GalleryItemRouteArgs>(name);
}

class GalleryItemRouteArgs {
  const GalleryItemRouteArgs({
    required this.imageInfo,
    this.key,
  });

  final ImageGalleryModel imageInfo;

  final Key? key;

  @override
  String toString() {
    return 'GalleryItemRouteArgs{imageInfo: $imageInfo, key: $key}';
  }
}

/// generated route for
/// [GalleryScreen]
class GalleryRoute extends PageRouteInfo<void> {
  const GalleryRoute({List<PageRouteInfo>? children})
      : super(
          GalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GalleryStackScreen]
class GalleryStackRoute extends PageRouteInfo<void> {
  const GalleryStackRoute({List<PageRouteInfo>? children})
      : super(
          GalleryStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryStackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
