
library core;

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

part "di/di.dart";


enum TabType {

  newTab(true), popular(false);

  final bool isNew;

 const TabType(this.isNew);

}

extension TabTypeExtension on TabType {

  String getLocalizedTitle() {

   return switch (this) {
     TabType.newTab => 'NEW',
     TabType.popular => 'POPULAR',
    };
  }

}