part of '../../presentation.dart';

@RoutePage()
class GalleryItemScreen extends StatelessWidget implements AutoRouteWrapper {
  final ImageGalleryModel imageInfo;

  const GalleryItemScreen({required this.imageInfo, super.key});

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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imageInfo.name,
                      style: context.styling.textTheme.itemTitle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                            state.item?.username ?? '',
                            style: context.styling.textTheme.itemUser,
                          ),
                        Text(
                          DateConverterHelper.convertDate(
                            imageInfo.dateCreate,
                          ),
                          style: context.styling.textTheme.itemDate,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      imageInfo.description,
                      style: context.styling.textTheme.itemDescription,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

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
}
