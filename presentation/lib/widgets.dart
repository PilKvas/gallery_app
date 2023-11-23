part of presentation;


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
              SvgPicture.asset("assets/logo.svg"),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Oh shucks!',
                style: Theme.of(context).textTheme.errorTitle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Slow or no internet connection.\nPlease check your internet settings',
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