import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/analytics/i_use_case_analytics.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/login/controllers/login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final IUseCaseUser _useCaseUser = locator.get<IUseCaseUser>();
  final IUseCaseAnalytics _useCaseAnalytics = locator.get<IUseCaseAnalytics>();

  LoginScreenCubit(super.initialState);

  bool isLoggedIn() {
    return _useCaseUser.isUserLoggedIn();
  }

  void signedIn() async {
    _useCaseAnalytics.logLogin();
  }

  Future<User?> createUser() async {
    User? user = _useCaseUser.getCurrentUser();

    if (user != null) {
      return _useCaseUser.createUser(user);
    }

    return null;
  }
}
