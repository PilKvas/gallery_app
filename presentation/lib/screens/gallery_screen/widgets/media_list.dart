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

    return RefreshIndicator(
      onRefresh: () async {
        return bloc.add(
          GalleryEvent.galleryListLoaded(
            isNew: widget.isNew,
            refresh: true,
          ),
        );
      },
      child: SingleChildScrollView(
        controller: scrollController,
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            if (state.status == Status.loading && !state.isPaginating) {
              return SizedBox(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 2),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomProgressIndicator(),
                      Text('Loading...'),
                    ],
                  ),
                ),
              );
            }
            return Column(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(
                          GalleryItemRoute(
                            imageInfo: state.item[index],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FadeInImage.memoryNetwork(
                              imageErrorBuilder: (context, error, trace) {
                                return const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                );
                              },
                              placeholder: kTransparentImage,
                              image: AppConst.apiUrlMedia + state.item[index].image!.name,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                if (state.status == Status.loading && state.isPaginating) ...[
                  const Center(
                    child: CustomProgressIndicator(),
                  ),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
