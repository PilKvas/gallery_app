part of '../domain.dart';

abstract class UserRepository{
  Future<UserModel> getUserInfo({required int id});

}