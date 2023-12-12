part of '../presentation.dart';

class FilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double width;

  const FilledButton({required this.title, required this.width, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.main;
              }
              return Colors.black;
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
