import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';

class MockUseCaseUser implements IUseCaseUser {
  @override
  Future<User?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User?> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
