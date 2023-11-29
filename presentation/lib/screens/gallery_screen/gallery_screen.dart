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
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              controller: controller,
              indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
              tabs: [
                Tab(
                  text: S.of(context).newTab,
                ),
                Tab(
                  text: S.of(context).popularTab,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
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
                        name: textController.text,
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
      ),
    );
  }
}
