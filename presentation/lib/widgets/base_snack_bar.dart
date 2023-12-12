part of '../presentation.dart';

class BaseSnackBar {
  static void showBaseSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.main,
      content: Center(
        child: Text(context.localization.registrationSuccessful),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
