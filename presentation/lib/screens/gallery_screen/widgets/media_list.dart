part of '../../../presentation.dart';

class MediaList extends StatelessWidget {
  const MediaList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      return switch (state.status) {
        Status.loading => const CircularProgressIndicator(),
        Status.success => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: state.item.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  state.item[index].image.name,
                  fit: BoxFit.fill,
                ),
              );
            }),
        Status.failure => const NoInternetConnectionWidget(),
        Status.initial => const Text("initial"),
      };
    });
  }
}
