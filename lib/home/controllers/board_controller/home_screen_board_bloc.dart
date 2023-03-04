import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_event.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_state.dart';
import 'package:flutter_starter/injection.dart';

class HomeScreenBoardBloc
    extends Bloc<FetchBoardsTriggered, HomeScreenBoardState> {
  final IUseCaseBoard _useCaseBoard = locator.get<IUseCaseBoard>();

  HomeScreenBoardBloc(super.initialState) {
    on<FetchBoardsTriggered>((event, emit) async {
      emit(HomeScreenBoardState.fetching(state, true));
      final boards = await _fetchBoards();
      emit(HomeScreenBoardState.withBoards(boards));
    });
  }

  Future<List<Board>> _fetchBoards() async {
    return await _useCaseBoard.fetchBoards();
  }
}
