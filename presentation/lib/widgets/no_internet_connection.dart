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
          height: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SvgPicture.asset('assets/logo.svg'),
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
