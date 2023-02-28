import 'package:flutter_starter/common/models/user.dart';

abstract class IUseCaseUser {
  Future<User?> getUser();

  Future<User?> saveUser(User user);
}
