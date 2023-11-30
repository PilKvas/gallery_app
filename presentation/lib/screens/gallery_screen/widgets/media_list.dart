part of '../../../presentation.dart';

class MediaList extends StatelessWidget {
  final bool isNew;

  const MediaList({required this.isNew, super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GalleryBloc>();

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          bloc.add(
            GalleryEvent.galleryListLoaded(
              isNew: isNew,
            ),
          );
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async => bloc.add(
          GalleryEvent.galleryListLoaded(
            isNew: isNew,
            refresh: true,
          ),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<GalleryBloc, GalleryState>(
            builder: (context, state) {
              return Column(
                children: [
                  BaseTextField(
                    onChanged: (text) {
                      bloc.add(
                        GalleryEvent.galleryListLoaded(
                          isNew: isNew,
                          name: text,
                          refresh: true,
                        ),
                      );
                    },
                    onPressed: () {
                      bloc.add(
                        GalleryEvent.galleryListLoaded(
                          isNew: isNew,
                          refresh: true,
                        ),
                      );
                    },
                  ),
                  if (state.status == Status.loading && !state.isPaginating) ...[
                    const LoadingWidget(),
                  ],
                  if (state.status == Status.success && state.item.isEmpty) ...[
                    const EmptyListWidget(),
                  ],
                  if (state.item.isNotEmpty) ...[
                    GridWidget(state: state),
                  ],
                  if (state.status == Status.loading && state.isPaginating) ...[
                    const PaginationLoaderWidget(),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
