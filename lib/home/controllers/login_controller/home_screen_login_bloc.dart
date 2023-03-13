import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_event.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_state.dart';
import 'package:flutter_starter/locator.dart';

class HomeScreenLoginBloc extends Bloc<LogOutPressed, HomeScreenLoginState> {
  final IUseCaseUser _useCaseUser = locator.get<IUseCaseUser>();

  HomeScreenLoginBloc(super.initialState) {
    on<LogOutPressed>((event, emit) async {
      await _logout();
      emit(HomeScreenLoginState(isLoggedIn: false));
    });
  }

  Future<void> _logout() async {
    await _useCaseUser.logout();
  }
}
