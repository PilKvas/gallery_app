part of domain;

abstract class UserRepository{
  Future<UserModel> getUserInfo({required int id});

}