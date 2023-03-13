import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_event.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/full_board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/utils/string_utils.dart';

class BoardScreenBloc extends Bloc<BoardScreenEvent, BoardScreenState> {
  final IUseCaseBoard _useCaseBoard = locator.get<IUseCaseBoard>();
  final IUseCaseBoardList _useCaseBoardList = locator.get<IUseCaseBoardList>();

  BoardScreenBloc(super.initialState) {
    on<FetchFullBoard>((event, emit) async {
      emit(BoardScreenState.fetching(state, true));
      final fullBoard = await _fetchFullBoard();
      emit(BoardScreenState(fullBoard));
    });

    on<CreateBoardList>((event, emit) async {
      emit(BoardScreenState.fetching(state, true));
      await _createBoardList(event.boardListName);
      final fullBoard = await _fetchFullBoard();
      emit(BoardScreenState(fullBoard));
    });

    on<UpdateBoardList>((event, emit) async {
      emit(BoardScreenState.fetching(state, true));
      await _updateBoardList(event.boardList);
      final fullBoard = await _fetchFullBoard();
      emit(BoardScreenState(fullBoard));
    });

    on<DeleteBoardList>((event, emit) async {
      emit(BoardScreenState.fetching(state, true));
      await _deleteBoardList(event.boardList);
      final fullBoard = await _fetchFullBoard();
      emit(BoardScreenState(fullBoard));
    });
  }

  Future<BoardList?> _createBoardList(String name) {
    name = renameListWithSameName(name)!;

    return _useCaseBoardList.createBoardList(
        BoardList.withUid(state.fullBoard.board.id)..name = name);
  }

  Future<bool> _deleteBoardList(BoardList boardList) async {
    return _useCaseBoardList.deleteBoardList(boardList);
  }

  Future<BoardList?> _updateBoardList(BoardList boardList) async {
    boardList.name = renameListWithSameName(boardList.name);

    return _useCaseBoardList.updateBoardList(boardList);
  }

  Future<FullBoard> _fetchFullBoard() async {
    return (await _useCaseBoard.fetchFullBoard(state.fullBoard.board.id))!;
  }

  String? renameListWithSameName(String? name) {
    String? newName = name;

    try {
      var found =
          state.fullBoard.boardLists?.firstWhere((list) => list.name == name);
      if (found != null) {
        return "$newName (${generateUid()})";
      }
    } catch (e) {
      //ignore
    }

    return newName;
  }
}
