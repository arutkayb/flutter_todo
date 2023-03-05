import 'package:flutter_starter/common/models/board.dart';

class BoardScreenState {
  bool fetching;
  Board? board;

  BoardScreenState(this.board) : fetching = false;

  BoardScreenState.fetching(BoardScreenState state, this.fetching)
      : board = state.board;
}
