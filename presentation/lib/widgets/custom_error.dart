part of '../presentation.dart';

class CustomError extends StatelessWidget {
  final String message;

  const CustomError({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: context.screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.webAntErrorLogo),
              const SizedBox(
                height: 20,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.errorSubtitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
