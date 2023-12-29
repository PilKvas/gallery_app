part of '../../../presentation.dart';

class GridWidget extends StatelessWidget {
  final GalleryState state;
  final int crossAxisCount;
  final ScrollPhysics? physics;

  const GridWidget({required this.state, required this.crossAxisCount, super.key, this.physics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        physics: physics,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
        ),
        itemCount: state.items.length,
        itemBuilder: (context, index) {
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
      ),
    );
  }
}
