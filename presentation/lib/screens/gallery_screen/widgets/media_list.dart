part of '../../../presentation.dart';

class MediaList extends StatelessWidget {
  final bool isNew;

  const MediaList({required this.isNew, super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GalleryBloc>();

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent) {
          bloc.add(GalleryEvent.loadGalleryList(isNew: isNew));
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async => bloc.add(
          GalleryEvent.loadGalleryList(
            isNew: isNew,
            refresh: true,
          ),
        ),
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            if (state.status == Status.failure) {
              return CustomError(
                message: state.error.message(context.localization),
              );
            }
            return Column(
              children: [
                BaseTextField(
                  hintText: context.localization.searchField,
                  prefixIcon: SvgPicture.asset(
                    AppAssets.searchIcon,
                    fit: BoxFit.none,
                  ),
                  showClearIcon: true,
                  isIconPressible: true,
                  onChanged: (text) => bloc.add(
                    GalleryEvent.loadGalleryList(
                      isNew: isNew,
                      name: text,
                      refresh: true,
                    ),
                  ),
                  onPressed: () => bloc.add(
                    GalleryEvent.loadGalleryList(
                      isNew: isNew,
                      refresh: true,
                    ),
                  ),
                  fillColor: AppColors.lightGrey,
                  icon: SvgPicture.asset(AppAssets.searchEraseIcon),
                  filled: true,
                ),
                if (state.items.isNotEmpty) ...[
                  Expanded(
                    child: BaseGrid(
                      state: state,
                      crossAxisCount: 2,
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
