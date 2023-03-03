import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';

class MockUseCaseUser extends UseCaseBase implements IUseCaseUser {
  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> createUserWithEmail(String email, String password) {
    // TODO: implement createUserWithEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCurrentUser() {
    // TODO: implement deleteCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }
}
