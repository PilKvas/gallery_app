part of '../../../presentation.dart';

class ItemContent extends StatelessWidget {
  final UserState state;
  final ImageGalleryModel imageInfo;

  const ItemContent({required this.imageInfo, required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            imageInfo.name,
            style: context.styling.textTheme.itemTitle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.item?.username ?? AppConst.empty,
                  style: context.styling.textTheme.itemUser,
                ),
                Text(
                  imageInfo.dateCreate.formatDate,
                  style: context.styling.textTheme.itemDate,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              imageInfo.description,
              style: context.styling.textTheme.itemDescription,
            ),
          ),
        ],
      ),
    );
  }
}