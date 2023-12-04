part of '../../../presentation.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      height: context.screenSize.height - (context.screenSize.height / 4),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomProgressIndicator(),
            Text(S.of(context).loading),
          ],
        ),
      ),
    );
  }
}
