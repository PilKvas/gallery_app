part of '../data.dart';

class CachedUserRepositoryImpl implements CachedUserRepository {
  final FlutterSecureStorage _secureStorage;
  final Mapper mapper = Mapper();

  CachedUserRepositoryImpl({
    required FlutterSecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  @override
  Future<void> deleteUserData() async {
    await _secureStorage.delete(key: AppConst.userKey);
  }

  @override
  Future<UserModel?> getUserData() async {
    final json = await _secureStorage.read(key: AppConst.userKey);

    if (json != null) {
      final userDto = UserDto.fromJson(jsonDecode(json) as Map<String, dynamic>);

      return mapper.convert<UserDto, UserModel>(userDto);
    }

    return null;
  }

  @override
  Future<void> saveUserData({required UserModel userModel}) async {
    final userDto = mapper.convert<UserModel, UserDto>(userModel);

    await _secureStorage.write(
      key: AppConst.userKey,
      value: json.encode(
        userDto.toJson(),
      ),
    );
  }
}
