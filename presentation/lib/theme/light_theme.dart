part of '../presentation.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: AppColors.hightLightColor,
    labelColor: Colors.black,
    unselectedLabelColor: AppColors.subTitleColor,
    unselectedLabelStyle: TextStyle(
      color: AppColors.subTitleColor,
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
        color: AppColors.titleColor,
        fontSize: 20,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      );

  TextStyle get errorSubtitle => const TextStyle(
        color: AppColors.subTitleColor,
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
        color: Color(0xFFBCBCBC),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      );

  TextStyle get itemRolePlay => const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
      );

  TextStyle get itemDate => const TextStyle(
        color: Color(0xFFBCBCBC),
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

}
