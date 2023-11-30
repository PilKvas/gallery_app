part of data;

class UserRepositoryImpl implements UserRepository {
  final UserMappr mapper = UserMappr();
  final GalleryDetailsService service;

  UserRepositoryImpl({required this.service});

  @override
  Future<UserModel> getUserInfo({required int id}) async {
    final UserDto userInfo = await service.getUser(id: id);
    return mapper.convert(userInfo);
  }
}
