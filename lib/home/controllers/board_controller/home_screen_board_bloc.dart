import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_event.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_state.dart';
import 'package:flutter_starter/injection.dart';

class HomeScreenBoardBloc
    extends Bloc<BoardEvent, HomeScreenBoardState> {
  final IUseCaseBoard _useCaseBoard = locator.get<IUseCaseBoard>();

  HomeScreenBoardBloc(super.initialState) {
    on<FetchBoardsTriggered>((event, emit) async {
      emit(HomeScreenBoardState.fetching(state, true));
      final boards = await _fetchBoards();
      emit(HomeScreenBoardState.withBoards(boards));
    });

    on<BoardUpdated>((event, emit) async {
      // TODO: Do not fetch, just update the board with local value
      emit(HomeScreenBoardState.fetching(state, true));
      final boards = await _fetchBoards();
      emit(HomeScreenBoardState.withBoards(boards));
    });

    on<BoardCreated>((event, emit) async {
      // TODO: Do not fetch, just update the board with local value
      emit(HomeScreenBoardState.fetching(state, true));
      await _createBoard(event.boardName, event.boardDescription); // TODO: Check for errors and notify the user
      final boards = await _fetchBoards();
      emit(HomeScreenBoardState.withBoards(boards));
    });

    on<BoardDeleted>((event, emit) async {
      // TODO: Do not fetch, just update the board with local value
      emit(HomeScreenBoardState.fetching(state, true));
      await _deleteBoard(event.board); // TODO: Check for errors and notify the user
      final boards = await _fetchBoards();
      emit(HomeScreenBoardState.withBoards(boards));
    });
  }

  Future<Board?> _createBoard(String boardName, String? boardDescription) async{
    return await _useCaseBoard.createBoard(boardName, boardDescription);
  }

  Future<bool?> _deleteBoard(Board board) async{
    return await _useCaseBoard.deleteBoard(board.id);
  }


  Future<List<Board>> _fetchBoards() async {
    return await _useCaseBoard.fetchBoards();
  }
}
