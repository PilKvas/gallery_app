part of '../../presentation.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SizedBox(
        height: context.screenSize.height,
        width: context.screenSize.width,
        child: ListView(
          children: [
            SizedBox(
              height: context.screenSize.height * 0.66,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                    ),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        border: BorderDirectional(
                          bottom: BorderSide(
                            color: AppColors.main,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        child: Text(
                          context.localization.signIn,
                          style: context.styling.textTheme.authorizationTitle,
                        ),
                      ),
                    ),
                  ),
                  BaseTextField(
                    hintText: context.localization.email,
                    showClearIcon: false,
                    icon: SvgPicture.asset(AppAssets.mailIcon),
                    filled: false,
                  ),
                  BaseTextField(
                    hintText: context.localization.password,
                    showClearIcon: false,
                    icon: SvgPicture.asset(AppAssets.eyeIcon),
                    filled: false,
                    isPassword: true,
                    isIconPressible: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FilledButton(
                    onPressed: () {},
                    title: context.localization.signIn,
                    width: context.screenSize.width * 0.33,
                  ),
                  TextButtonWidget(
                    onPressed: () {
                      context.router.push(const RegistrationRoute());
                    },
                    title: context.localization.signUp,
                    width: context.screenSize.width * 0.33,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
