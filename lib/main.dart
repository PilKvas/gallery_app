import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:presentation/presentation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  initializeDependencies();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: _appRouter.config(),
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
