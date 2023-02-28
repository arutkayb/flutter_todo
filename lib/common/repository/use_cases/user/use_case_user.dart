import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';

class UseCaseUser extends UseCaseBase implements IUseCaseUser {
  @override
  Future<User?> getUser() async {
    return await localDataManager.getUserDao().read();
  }

  @override
  Future<User?> saveUser(User user) async {
    User? savedUser = await localDataManager.getUserDao().read();
    if (savedUser != null) {
      return await localDataManager.getUserDao().update(user);
    } else {
      return await localDataManager.getUserDao().create(user);
    }
  }
}
