part of '../presentation.dart';

class OutLinedButton extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback onPressed;

  const OutLinedButton({
    required this.title,
    required this.width,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.white,
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.main;
              }
              return AppColors.black;
            },
          ),
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return const BorderSide(
                  color: AppColors.main,
                );
              }
              return const BorderSide(
                color: AppColors.black,
              );
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
