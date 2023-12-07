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
          page: OnBoardingRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: GalleryStackRoute.page,
              children: [
                AutoRoute(
                  path: 'gallery',
                  initial: true,
                  page: GalleryRoute.page,
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
