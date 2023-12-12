part of '../../../presentation.dart';

class ItemImage extends StatelessWidget {
  final ImageGalleryModel imageInfo;

  const ItemImage({required this.imageInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      height: context.screenSize.height * 0.33,
      child: InteractiveViewer(
        scaleFactor: 100,
        panEnabled: false,
        minScale: 0.1,
        maxScale: 1.2,
        clipBehavior: Clip.none,
        child: Image.network(
          '${AppConst.apiUrlMedia}${imageInfo.image?.name}',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.error,
            color: Colors.red,
            size: 40,
          ),
        ),
      ),
    );
  }
}
