part of '../presentation.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({
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
            children: [
              SvgPicture.asset(AppAssets.webAntLogo),
              const SizedBox(
                height: 20,
              ),
              Text(
                '',
                style: Theme.of(context).textTheme.errorTitle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.errorSubtitle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
