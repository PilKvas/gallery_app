part of '../../presentation.dart';

@RoutePage()
class GalleryStackScreen extends StatelessWidget {
  const GalleryStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              TabBar(
                controller: controller,
                indicatorColor: context.styling.tabBarTheme.indicatorColor,
                tabs: [
                  Tab(text: context.localization.newTab),
                  Tab(text: context.localization.popularTab),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: List.generate(
                    2,
                    (index) {
                      return BlocProvider(
                        create: (_) => GalleryBloc(
                          fetchDataUseCase: injection(),
                        )..add(
                            GalleryEvent.galleryListLoaded(
                              isNew: index == 0,
                            ),
                          ),
                        child: MediaList(
                          isNew: index == 0,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
