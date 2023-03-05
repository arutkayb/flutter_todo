import 'package:flutter_starter/common/models/full_board.dart';

class BoardScreenState {
  bool fetching;
  FullBoard fullBoard;

  BoardScreenState(this.fullBoard) : fetching = false;

  BoardScreenState.fetching(BoardScreenState state, this.fetching)
      : fullBoard = state.fullBoard;
}
