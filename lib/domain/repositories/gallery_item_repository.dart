import 'package:flutter_generating_practice/domain/models/user.dart';

abstract class GalleryItemRepository{
  Future<User> getUser();
}