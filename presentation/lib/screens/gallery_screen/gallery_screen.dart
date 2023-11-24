part of presentation;

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
            hintText: 'Search',
            suffixIcon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 237, 89, 146),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(),
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
              tabs: const [
                Tab(
                  text: 'New',
                ),
                Tab(
                  text: 'Popular',
                ),
              ],
            ),
          ),
        ),
      ),

      body: TabBarView(
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
            child: MediaList(isNew: index == 0),
          );
          },
        ),
      ),
    );
  }
}
