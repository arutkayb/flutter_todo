import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/home/controllers/home_screen_state.dart';
import 'package:flutter_starter/injection.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final IUseCaseUser _useCaseUser = locator.get<IUseCaseUser>();

  HomeScreenCubit(super.initialState) {
    refreshUser();
  }

  Future<void> refreshUser() async {
    emit(HomeScreenState.fetching(state));
    final User? user = await _useCaseUser.getUser();
    emit(HomeScreenState(user, true));
  }
}
