

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generating_practice/core/di/di.dart';


void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const GalleryScreen(),
    );
  }
}
