import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';

class UseCaseUser extends UseCaseBase implements IUseCaseUser {
  @override
  Future<bool> isUserLoggedIn() async {
    return remoteDataManager.isUserLoggedIn();
  }

  @override
  Future<void> logout() async {
    return remoteDataManager.logout();
  }

  @override
  Future<User?> getCurrentUser() async {
    return remoteDataManager.getCurrentUser();
  }

  @override
  Future<bool> createUserWithEmail(String email, String password) {
    return remoteDataManager.createUserWithEmail(email, password);
  }

  @override
  Future<bool> deleteCurrentUser() {
    return remoteDataManager.deleteCurrentUser();
  }

  @override
  Future<bool> signInWithEmail(String email, String password) {
    return remoteDataManager.signInWithEmail(email, password);
  }
}
