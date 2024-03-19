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
      )..add(
          ProfileEditEvent.initialize(
            id: state!.id.toString(),
            userName: state?.username ?? AppConst.empty,
            phoneNumber: state?.phone ?? AppConst.empty,
            email: state?.email ?? AppConst.empty,
            birthDay: state?.birthDay,
          ),
        ),
      child: this,
    );
  }
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  void _profileListener(BuildContext context, ProfileEditState state) {
    if (state.error != ErrorState.unknown) {
      BaseSnackBar.showBaseSnackBar(
        context,
        context.localization.thereIsSomeProblem,
      );
    }
  }

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
      child: BlocListener<ProfileEditBloc, ProfileEditState>(
        listener: _profileListener,
        child: BaseScaffold(
          appBar: BaseAppBar(
            actions: [
              SizedBox(
                width: 50,
                child: BaseTextButton(
                  child: Text(context.localization.save),
                  onPressed: () => bloc.add(
                    ProfileEditEvent.updateUser(
                      id: widget.state!.id.toString(),
                    ),
                  ),
                  width: 40,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.localization.personalData,
                    ),
                    BlocBuilder<ProfileEditBloc, ProfileEditState>(
                      buildWhen: (oldState, newState) => oldState.userName != newState.userName,
                      builder: (context, state) {
                        return BaseTextField(
                          isEditTextField: true,
                          initialValue: state.userName,
                          onChanged: (value) {
                            bloc.add(ProfileEditEvent.inputName(userName: value));
                          },
                          isDebounsed: false,
                          filled: false,
                          showClearIcon: false,
                          icon: SvgPicture.asset(AppAssets.mailIcon),
                          hintText: context.localization.userNameRequired,
                          errorText: state.fields[Fields.userNameField]?.call(context.localization),
                        );
                      },
                    ),
                    BlocBuilder<ProfileEditBloc, ProfileEditState>(
                      buildWhen: (oldState, newState) => oldState.birthDate != newState.birthDate,
                      builder: (context, state) {
                        return BaseTextField(
                          isEditTextField: true,
                          initialValue: state.birthDate.formatDate,
                          readOnly: true,
                          filled: false,
                          showClearIcon: false,
                          onDateChange: (date) {
                            bloc.add(
                              ProfileEditEvent.pickDate(birthDate: date),
                            );
                          },
                          hintText: context.localization.birthday,
                          icon: SvgPicture.asset(AppAssets.calendarIcon),
                        );
                      },
                    ),
                    BlocBuilder<ProfileEditBloc, ProfileEditState>(
                      buildWhen: (oldState, newState) => oldState.number != newState.number,
                      builder: (context, state) {
                        return BaseTextField(
                          isEditTextField: true,
                          initialValue: state.number,
                          filled: false,
                          onChanged: (value) {
                            bloc.add(ProfileEditEvent.inputNumber(number: value));
                          },
                          inputFormatters: [
                            AppConst.phoneMask,
                          ],
                          showClearIcon: false,
                          isDebounsed: false,
                          icon: SvgPicture.asset(AppAssets.phoneIcon),
                          hintText: context.localization.phoneNumberRequired,
                          errorText: state.fields[Fields.phoneNumberField]?.call(context.localization),
                        );
                      },
                    ),
                    BlocSelector<ProfileEditBloc, ProfileEditState, (String Function(S)?, String?)>(
                      selector: (state) => (state.fields[Fields.emailField], state.email),
                      builder: (context, state) {
                        return BaseTextField(
                          isEditTextField: true,
                          initialValue: state.$2,
                          onChanged: (value) {
                            bloc.add(ProfileEditEvent.inputEmail(email: value));
                          },
                          isDebounsed: false,
                          filled: false,
                          showClearIcon: false,
                          icon: SvgPicture.asset(AppAssets.mailIcon),
                          hintText: context.localization.emailRequired,
                          errorText: state.$1?.call(context.localization),
                        );
                      },
                    ),
                  ],
                ),
                BaseTextButton(
                  child: Text(context.localization.signOut),
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
        ),
      ),
    );
  }
}
