part of '../domain.dart';

abstract class MediaRepository {
  Future<MediaModel> uploadMedia(
    File filePath,
  );
}
