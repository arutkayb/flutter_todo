import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';

class MockUseCaseUser implements IUseCaseUser {
  @override
  bool isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
