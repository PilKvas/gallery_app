part of '../../presentation.dart';

@RoutePage()
class GalleryItemScreen extends StatelessWidget implements AutoRouteWrapper {
  final ImageGalleryModel imageInfo;

  const GalleryItemScreen({required this.imageInfo, super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        injection(),
      )..add(
          UserEvent.loadUser(id: imageInfo.user),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(
              child: CustomProgressIndicator(),
            );
          }
          return Column(
            children: [
              ItemImage(
                imageInfo: imageInfo,
              ),
              ItemContent(
                imageInfo: imageInfo,
                state: state,
              )
            ],
          );
        },
      ),
    );
  }
}
