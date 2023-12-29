part of '../presentation.dart';

class BaseTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;

  const BaseTextButton({required this.title, required this.onPressed, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.main;
              }
              return AppColors.black;
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
