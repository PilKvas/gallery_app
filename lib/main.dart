import 'package:data/data.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_generating_practice/presentation/extensions/theme/light_theme.dart';
import 'package:flutter_generating_practice/presentation/screens/gallery_screen/gallery_screen.dart';

void main() {
  final dio = Dio(); // Provide a dio instance
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
