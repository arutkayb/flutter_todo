import 'package:flutter_starter/common/models/user.dart';

abstract class IUseCaseUser {
  Future<User> createUser(User user);

  Future<User> createUserWithEmail(String email, String password);

  Future<bool> signInWithEmail(String email, String password);

  Future<bool> deleteCurrentUser();

  User? getCurrentUser();

  Future<List<User>> getUsers();

  bool isUserLoggedIn();

  Future<void> logout();
}
