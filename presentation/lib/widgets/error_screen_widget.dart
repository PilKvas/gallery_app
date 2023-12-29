part of '../presentation.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
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
                context.localization.thereIsSomeProblem,
                style: Theme.of(context).textTheme.errorTitle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                context.localization.tryAgainLater,
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
