part of '../presentation.dart';

class BaseGrid extends StatelessWidget {
  final GalleryState state;
  final int crossAxisCount;
  final ScrollPhysics? physics;

  const BaseGrid({
    required this.state,
    required this.crossAxisCount,
    super.key,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: physics,
      shrinkWrap: true,
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () => context.router.push(
                  GalleryItemRoute(
                    imageInfo: state.items[index],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
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
                        fit: BoxFit.fill,
                        placeholder: kTransparentImage,
                        imageErrorBuilder: (_, __, ___) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        image: '${AppConst.apiUrlMedia}${state.items[index].image?.name}',
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: state.items.length,
          ),
        ),
        if (state.status == Status.loading && state.isPaginating) ...[
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: CustomProgressIndicator(),
              ),
            ),
          ),
        ] else if (state.status == Status.loading) ...[
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: CustomProgressIndicator(),
              ),
            ),
          ),
        ] else if (state.items.isEmpty) ...[
          const SliverToBoxAdapter(
            child: EmptyListWidget(),
          ),
        ],
      ],
    );
  }
}
