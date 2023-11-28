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
          path: '/',
          page: HomeRoute.page,
          initial: true,
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
