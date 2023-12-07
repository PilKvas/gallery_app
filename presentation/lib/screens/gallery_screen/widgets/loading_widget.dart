part of '../../../presentation.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  const LoadingWidget({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      height: context.screenSize.height / 4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProgressIndicator(color: color),
            Text(context.localization.loading),
          ],
        ),
      ),
    );
  }
}
