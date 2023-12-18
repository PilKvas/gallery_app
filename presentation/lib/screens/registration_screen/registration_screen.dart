part of '../../presentation.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationBloc(
        register: injection(),
      ),
      child: this,
    );
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _birthDateController = TextEditingController();
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  DateTime? _birthDate;

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _userNameController.clear();
    _passwordController.clear();
    _birthDateController.clear();
    _phoneNumberController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegistrationBloc>();

    return Scaffold(
      appBar: const BaseAppBar(),
      body: SizedBox(
        width: context.screenSize.width,
        child: ListView(
          children: [
            BlocConsumer<RegistrationBloc, RegistrationState>(
              buildWhen: (old, current) => old.fields != current.fields,
              listener: (context, state) {
                if (state.status == Status.success) {
                  context.router.replace(
                    const LoginRoute(),
                  );
                  BaseSnackBar.showBaseSnackBar(context);
                }
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    Column(
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
                                context.localization.signUp,
                                style: context.styling.textTheme.authorizationTitle,
                              ),
                            ),
                          ),
                        ),
                        BaseTextField(
                          filled: false,
                          showClearIcon: false,
                          controller: _userNameController,
                          icon: SvgPicture.asset(AppAssets.userNameIcon),
                          hintText: context.localization.userNameRequired,
                          errorText: state.fields[Fields.userNameField]?.call(context.localization),
                        ),
                        BaseTextField(
                          readOnly: true,
                          showClearIcon: false,
                          filled: false,
                          onDateChange: (date) {
                            _birthDate = date;
                          },
                          controller: _birthDateController,
                          hintText: context.localization.birthday,
                          icon: SvgPicture.asset(AppAssets.calendarIcon),
                        ),
                        BaseTextField(
                          showClearIcon: false,
                          filled: false,
                          inputFormatters: [
                            AppConst.phoneMask,
                          ],
                          keyboardType: TextInputType.phone,
                          controller: _phoneNumberController,
                          icon: SvgPicture.asset(AppAssets.phoneIcon),
                          hintText: context.localization.phoneNumberRequired,
                          errorText: state.fields[Fields.phoneNumberField]?.call(context.localization),
                        ),
                        BaseTextField(
                          showClearIcon: false,
                          filled: false,
                          controller: _emailController,
                          icon: SvgPicture.asset(AppAssets.mailIcon),
                          hintText: context.localization.emailRequired,
                          errorText: state.fields[Fields.emailField]?.call(context.localization),
                        ),
                        BaseTextField(
                          showClearIcon: false,
                          filled: false,
                          isPassword: true,
                          isIconPressible: true,
                          controller: _passwordController,
                          icon: SvgPicture.asset(AppAssets.eyeIcon),
                          hintText: context.localization.passwordRequired,
                          errorText: state.fields[Fields.passwordField]?.call(context.localization),
                        ),
                        BaseTextField(
                          showClearIcon: false,
                          filled: false,
                          isPassword: true,
                          isIconPressible: true,
                          controller: _confirmPasswordController,
                          icon: SvgPicture.asset(AppAssets.eyeIcon),
                          hintText: context.localization.confirmPasswordRequired,
                          errorText: state.fields[Fields.confirmField]?.call(context.localization),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: FilledButton(
                            onPressed: () {
                              bloc.add(
                                RegistrationEvent.signUp(
                                  birthDay: _birthDate,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  userName: _userNameController.text,
                                  phoneNumber: _phoneNumberController.text,
                                  confirmPassword: _confirmPasswordController.text,
                                ),
                              );
                            },
                            title: context.localization.signUp,
                            width: context.screenSize.width * 0.33,
                          ),
                        ),
                        TextButtonWidget(
                          onPressed: () => context.router.push(
                            const LoginRoute(),
                          ),
                          title: context.localization.signIn,
                          width: context.screenSize.width * 0.33,
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
          ],
        ),
      ),
    );
  }
}
