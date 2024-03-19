import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

part 'routing.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
        ),
        AutoRoute(
          page: MediaRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: ProfileStackRoute.page,
              children: [
                AutoRoute(
                  path: 'profile',
                  page: ProfileRoute.page,
                  initial: true,
                ),
                AutoRoute(
                  path: 'profileEdit',
                  page: ProfileEditRoute.page,
                ),
                AutoRoute(
                  path: 'item',
                  page: GalleryItemRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: GalleryStackRoute.page,
              children: [
                AutoRoute(
                  path: 'gallery',
                  page: GalleryRoute.page,
                  initial: true,
                ),
                AutoRoute(
                  path: 'item',
                  page: GalleryItemRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
