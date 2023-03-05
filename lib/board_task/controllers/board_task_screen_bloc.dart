import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/injection.dart';

class BoardTaskScreenBloc extends Bloc<dynamic, BoardScreenState> {
  final IUseCaseBoardTask _useCaseBoardTask = locator.get<IUseCaseBoardTask>();

  BoardTaskScreenBloc(super.initialState) {
    on<dynamic>((event, emit) async {

    });
  }
}
