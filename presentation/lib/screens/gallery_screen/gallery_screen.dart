part of presentation;

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      2,
                      (index) => BlocProvider(
                        create: (_) => GalleryBloc(GetIt.I<FetchDataUseCase>())
                          ..add(
                            const GalleryEvent.galleryListLoaded(),
                          ),
                        child: MediaList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
