part of '../../../presentation.dart';


class ItemImage extends StatelessWidget {
  final ImageEntity imageInfo;
  const ItemImage({required this.imageInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: InteractiveViewer(
        scaleFactor: 100,
        panEnabled: false,
        minScale: 0.1,
        maxScale: 1.2,
        clipBehavior: Clip.none,
        child: Image.network(
          imageInfo.image?.name ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
