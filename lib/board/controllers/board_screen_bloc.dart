import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_event.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/injection.dart';

class BoardScreenBloc extends Bloc<dynamic, BoardScreenState> {
  final IUseCaseBoardList _useCaseBoardList = locator.get<IUseCaseBoardList>();

  BoardScreenBloc(super.initialState) {
    on<FetchBoardLists>((event, emit) async {
      emit(BoardScreenState.fetching(state, true));
      final boardLists = await _fetchBoardLists();
      emit(BoardScreenState.withBoardLists(state, boardLists));
    });

    on<CreateBoardList>((event, emit) async {
      emit(BoardScreenState.fetching(state, true));
      final boardList = await _createBoardList(event.boardListName);
      final boardLists = await _fetchBoardLists();

      emit(BoardScreenState.withBoardLists(state, boardLists));
    });
  }

  Future<BoardList?> _createBoardList(String name) {
    return _useCaseBoardList
        .createBoardList(BoardList.withUid(state.board.id)..name = name);
  }

  Future<List<BoardList>> _fetchBoardLists() {
    return _useCaseBoardList.fetchBoardLists(state.board);
  }
}
