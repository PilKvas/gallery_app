part of '../../../presentation.dart';

class MediaList extends StatefulWidget {
  final bool isNew;

  const MediaList({required this.isNew, super.key});

  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
      context.read<GalleryBloc>().add(
            GalleryEvent.galleryListLoaded(isNew: widget.isNew),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GalleryBloc>();


    return SingleChildScrollView(
      controller: scrollController,
      child: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {

          if (state.status == Status.loading && !state.isPaginating) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Loading...'),
                ],
              ),
            );
          }
            return RefreshIndicator(
              onRefresh: () async {
                return bloc.add(
                  GalleryEvent.galleryListLoaded(
                    isNew: widget.isNew,
                    refresh: true,
                  ),
                );
              },

              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.item.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          state.item[index].image?.name ?? '',
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                  if (state.status == Status.loading && state.isPaginating) ...[


                    const Center(child: CircularProgressIndicator(),),

                  ]

                ],
              ),
            );
        },
      ),
    );
  }
}
