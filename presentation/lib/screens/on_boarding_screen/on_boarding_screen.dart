part of '../../presentation.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: context.screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.webAntLogo,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 80,
                  ),
                  child: Text(
                    context.localization.WelcomeText,
                    style: context.styling.textTheme.onBoardingTitle,
                  ),
                ),
                FilledButton(
                  onPressed: () => context.router.push(
                    const RegistrationRoute(),
                  ),
                  width: context.screenSize.width,
                  title: context.localization.createAccount,
                ),
                BaseOutlinedButton(
                  onPressed: () => context.router.push(
                    const LoginRoute(),
                  ),
                  width: context.screenSize.width,
                  title: context.localization.alreadyHaveAnAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
