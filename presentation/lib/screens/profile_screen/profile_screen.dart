part of '../../presentation.dart';

@RoutePage()
class ProfileStackScreen extends StatelessWidget {
  const ProfileStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  void _profileListener(ProfileState state, BuildContext context, GalleryBloc bloc) {
    if (state.status == Status.success) {
      bloc.add(
        GalleryEvent.loadGalleryList(
          id: state.user?.id,
          limit: AppConst.profileLimit,
        ),
      );
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(
            userUseCase: injection(),
          )..add(const ProfileEvent.loadUserData()),
        ),
        BlocProvider(
          create: (context) => GalleryBloc(
            fetchDataUseCase: injection(),
          ),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GalleryBloc>();
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) => _profileListener(
        state,
        context,
        bloc,
      ),
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBar(
            elevation: 1,
            actions: [
              IconButton(
                onPressed: () {
                  context.router.push(
                    ProfileEditRoute(state: state.user),
                  );
                },
                icon: SvgPicture.asset(AppAssets.settingsIcon),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.main,
                    ),
                  ),
                ),
                height: context.screenSize.height * 0.25,
                width: context.screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                            AppAssets.profilePicture,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        Column(
                          children: [
                            if (state.user?.username != null) ...[
                              Text(state.user!.username!),
                            ],
                            if (state.user?.birthDay != null) ...[
                              Text(state.user!.birthDay!.formatDate ?? AppConst.empty),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<GalleryBloc, GalleryState>(
                builder: (context, state) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        bloc.add(
                          GalleryEvent.loadGalleryList(id: state.user?.id),
                        );
                      }
                      return false;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: RefreshIndicator(
                        onRefresh: () async => bloc.add(
                          GalleryEvent.loadGalleryList(
                            id: state.user?.id,
                            refresh: true,
                            limit: AppConst.profileLimit,
                          ),
                        ),
                        child: BaseGrid(
                          state: state,
                          crossAxisCount: 4,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
