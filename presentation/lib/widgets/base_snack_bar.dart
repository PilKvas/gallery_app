part of '../presentation.dart';

class BaseSnackBar {
  static void showBaseSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.main,
      content: Center(
        child: Text(text),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class BaseAlertDialog {
  static Future<T?> showBaseAlertDialog<T>(BuildContext context, String title, String content) async {
    return showCupertinoDialog<T>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(context.localization.confirmation),
          content: Text(context.localization.areYouSure),
          actions: [
            TextButton(
              onPressed: () {
                context.router.pop(true);
              },
              child: Text(context.localization.yes),
            ),
            TextButton(
              onPressed: () {
                context.router.pop(false);
              },
              child: Text(context.localization.no),
            ),
          ],
        );
      },
    );
  }
}
