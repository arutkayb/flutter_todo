import 'package:flutter_starter/common/models/user.dart';

abstract class IUseCaseUser {
  Future<User?> getCurrentUser();

  Future<bool> isUserLoggedIn();

  Future<void> logout();
}
