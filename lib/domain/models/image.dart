class ImageGallery {
  ImageGallery({
    required this.image,
    required this.name,
    required this.id,
    required this.dateCreate,
    required this.description,
    required this.isNew,
    required this.isPopular,
    required this.user,
  });

  final String dateCreate;
  final String description;
  final int id;
  final bool isNew;
  final bool isPopular;
  final String name;
  final String user;
  final ImageDetails image;
}

class ImageDetails {
  ImageDetails({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}
