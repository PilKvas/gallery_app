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
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: S.of(context).searchField,
            suffixIcon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 237, 89, 146),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
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
