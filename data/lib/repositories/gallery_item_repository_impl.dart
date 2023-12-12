part of '../data.dart';

class UserRepositoryImpl implements UserRepository {
  final Mapper mapper = Mapper();
  final GalleryDetailsService service;

  UserRepositoryImpl({required this.service});

  @override
  Future<UserModel> getUserInfo({required int id}) async {
    final userInfo = await service.getUser(id: id);
    return mapper.convert<UserDto, UserModel>(userInfo);
  }
}
