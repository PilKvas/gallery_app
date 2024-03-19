part of '../presentation.dart';

class BaseTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final Widget child;

  const BaseTextButton({
    required this.onPressed,
    required this.width,
    required this.child,
    super.key,
  });

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
        child: child,
      ),
    );
  }
}
