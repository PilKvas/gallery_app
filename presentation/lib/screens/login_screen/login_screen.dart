part of '../../presentation.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(
        authUseCase: injection(),
      ),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userNameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthenticationBloc>();
    return BaseScaffold(
      appBar: const BaseAppBar(),
      body: SizedBox(
        height: context.screenSize.height,
        width: context.screenSize.width,
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == Status.success) {
              context.router.replaceAll([const GalleryStackRoute()]);
            }
            if (state.error == ErrorState.badRequest) {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColors.main,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                    content: SizedBox(
                      width: context.screenSize.width,
                      height: context.screenSize.height * 0.25,
                      child: Center(
                        child: Text(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          context.localization.badRequestText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                ListView(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                BaseTextField(
                                  filled: false,
                                  showClearIcon: false,
                                  controller: _userNameController,
                                  hintText: context.localization.userNameRequired,
                                  icon: SvgPicture.asset(AppAssets.userNameIcon),
                                  errorText: state.fields[Fields.userNameField]?.call(context.localization),
                                ),
                                BaseTextField(
                                  filled: false,
                                  isPassword: true,
                                  isIconPressible: true,
                                  showClearIcon: false,
                                  controller: _passwordController,
                                  hintText: context.localization.passwordRequired,
                                  icon: SvgPicture.asset(AppAssets.eyeIcon),
                                  errorText: state.fields[Fields.passwordField]?.call(context.localization),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          FilledButton(
                            onPressed: () {
                              bloc.add(
                                AuthenticationEvent.logIn(
                                  userName: _userNameController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                            title: context.localization.signIn,
                            width: context.screenSize.width * 0.33,
                          ),
                          BaseTextButton(
                            onPressed: () => context.router.push(const RegistrationRoute()),
                            child: Text(context.localization.signUp),
                            width: context.screenSize.width * 0.33,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.screenSize.height * 0.85,
                  child: Opacity(
                    opacity: state.status == Status.loading ? 1 : 0,
                    child: const LoadingWidget(color: AppColors.main),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
