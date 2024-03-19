part of '../presentation.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.main,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.main,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: AppColors.main,
    labelColor: Colors.black,
    unselectedLabelColor: AppColors.grey,
    unselectedLabelStyle: TextStyle(
      color: AppColors.grey,
      fontSize: 20,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
    ),
    labelStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
    ),
  ),
);

extension CustomTextThemeName on TextTheme {
  TextStyle get errorTitle => const TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      );

  TextStyle get errorSubtitle => const TextStyle(
        color: AppColors.grey,
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 1,
      );

  TextStyle get itemTitle => const TextStyle(
        color: Color(0xFF1D1D1D),
        fontSize: 22,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );

  TextStyle get itemUser => const TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );

  TextStyle get itemDate => const TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );

  TextStyle get itemDescription => const TextStyle(
        color: Color(0xFF1D1D1D),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );

  TextStyle get searchError => const TextStyle(
        color: AppColors.grey,
        fontSize: 20,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
      );

  TextStyle get onBoardingTitle => const TextStyle(
        color: AppColors.black,
        fontSize: 30,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      );

  TextStyle get authorizationTitle => const TextStyle(
        color: AppColors.black,
        fontSize: 30,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      );
}
