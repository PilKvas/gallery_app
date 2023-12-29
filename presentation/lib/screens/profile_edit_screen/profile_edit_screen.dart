part of '../../presentation.dart';

@RoutePage()
class ProfileEditScreen extends StatefulWidget implements AutoRouteWrapper {
  final UserModel? state;

  const ProfileEditScreen({required this.state, super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileEditBloc(
        userUseCase: injection(),
        authUseCase: injection(),
      ),
      child: this,
    );
  }
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _birthDateController = TextEditingController();
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();

  void _profileListener(ProfileEditState state) {
    if (state.error != ErrorState.unknown) {
      BaseSnackBar.showBaseSnackBar(
        context,
        context.localization.thereIsSomeProblem,
      );
    }
  }

  @override
  void initState() {
    _birthDateController.text = widget.state?.birthDay?.formatDate ?? AppConst.empty;
    _userNameController.text = widget.state?.username ?? AppConst.empty;
    _phoneNumberController.text = widget.state?.phone ?? AppConst.empty;
    _emailController.text = widget.state?.email ?? AppConst.empty;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _birthDateController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
  }

  DateTime? _birthDate;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileEditBloc>();
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await BaseAlertDialog.showBaseAlertDialog<bool>(
          context,
          context.localization.confirmation,
          context.localization.thereIsSomeProblem,
        );
        return shouldPop!;
      },
      child: BlocConsumer<ProfileEditBloc, ProfileEditState>(
        listener: (context, state) => _profileListener(state),
        builder: (context, state) {
          return BaseScaffold(
            appBar: BaseAppBar(
              actions: [
                SizedBox(
                  width: 50,
                  child: BaseTextButton(
                    title: context.localization.save,
                    onPressed: () => bloc.add(
                      ProfileEditEvent.updateUser(
                        email: _emailController.text,
                        id: widget.state!.id.toString(),
                        userName: _userNameController.text,
                        phoneNumber: _phoneNumberController.text,
                        birthDay: _birthDate,
                      ),
                    ),
                    width: 40,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.localization.personalData,
                      ),
                      BaseTextField(
                        showClearIcon: false,
                        filled: false,
                        controller: _userNameController,
                        hintText: context.localization.userNameRequired,
                        icon: SvgPicture.asset(AppAssets.userNameIcon),
                        errorText: state.fields[Fields.userNameField]?.call(context.localization),
                      ),
                      BaseTextField(
                        readOnly: true,
                        filled: false,
                        showClearIcon: false,
                        onDateChange: (date) {
                          _birthDate = date;
                        },
                        controller: _birthDateController,
                        hintText: context.localization.birthday,
                        icon: SvgPicture.asset(AppAssets.calendarIcon),
                      ),
                      BaseTextField(
                        filled: false,
                        inputFormatters: [
                          AppConst.phoneMask,
                        ],
                        showClearIcon: false,
                        controller: _phoneNumberController,
                        icon: SvgPicture.asset(AppAssets.phoneIcon),
                        hintText: context.localization.phoneNumberRequired,
                        errorText: state.fields[Fields.phoneNumberField]?.call(context.localization),
                      ),
                      BaseTextField(
                        filled: false,
                        showClearIcon: false,
                        controller: _emailController,
                        icon: SvgPicture.asset(AppAssets.mailIcon),
                        hintText: context.localization.emailRequired,
                        errorText: state.fields[Fields.emailField]?.call(context.localization),
                      ),
                    ],
                  ),
                  BaseTextButton(
                    title: context.localization.signOut,
                    onPressed: () {
                      bloc.add(const ProfileEditEvent.signOut());
                      context.router.replaceAll(
                        [
                          const OnBoardingRoute(),
                        ],
                      );
                    },
                    width: 100,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
