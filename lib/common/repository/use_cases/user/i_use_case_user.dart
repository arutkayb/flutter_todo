import 'package:flutter_starter/common/models/user.dart';

abstract class IUseCaseUser {
  Future<bool> createUserWithEmail(String email, String password);

  Future<bool> signInWithEmail(String email, String password);

  Future<bool> deleteCurrentUser();

  Future<User?> getCurrentUser();

  Future<bool> isUserLoggedIn();

  Future<void> logout();
}
