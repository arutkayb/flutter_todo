import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/login/controllers/login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final IUseCaseUser _useCaseUser = locator.get<IUseCaseUser>();

  LoginScreenCubit(super.initialState);

  bool isLoggedIn() {
    return _useCaseUser.isUserLoggedIn();
  }

  Future<User?> createUser() async {
    User? user = _useCaseUser.getCurrentUser();

    if (user != null) {
      return _useCaseUser.createUser(user);
    }

    return null;
  }
}
