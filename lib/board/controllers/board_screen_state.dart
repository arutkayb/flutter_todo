import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';

class BoardScreenState {
  bool fetching;
  Board board;
  List<BoardList>? boardLists;

  BoardScreenState(this.board) : fetching = false;

  BoardScreenState.fetching(BoardScreenState state, this.fetching)
      : board = state.board,
        boardLists = state.boardLists;

  BoardScreenState.withBoardLists(BoardScreenState state, this.boardLists)
      : board = state.board,
        fetching = false;
}
