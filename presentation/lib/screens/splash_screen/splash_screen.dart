part of '../../presentation.dart';

@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(
        authenticationUseCase: injection(),
        userUseCase: injection(),
      )..add(
          const SplashEvent.startApp(),
        ),
      child: this,
    );
  }

  void authenticationListener(BuildContext context, SplashState state) {
    if (state.status == Status.success) {
      FlutterNativeSplash.remove();

      context.router.replace(const GalleryRoute());
    } else if (state.status == Status.initial) {
      FlutterNativeSplash.remove();

      context.router.replace(const OnBoardingRoute());
    } else if (state.status == Status.failure) {
      FlutterNativeSplash.remove();

      context.router.replace(const OnBoardingRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: authenticationListener,
        child: const SizedBox(),
      ),
    );
  }
}
