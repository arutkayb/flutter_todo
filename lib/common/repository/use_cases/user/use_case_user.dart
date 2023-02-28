import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';

class UseCaseUser extends UseCaseBase implements IUseCaseUser {
  @override
  bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<void> logout() async {
    return FirebaseAuth.instance.signOut();
  }
}
