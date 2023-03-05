import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';

class BoardTaskScreenState {
  bool fetching;
  BoardTask boardTask;
  List<BoardList> boardLists;

  BoardTaskScreenState(this.boardTask, this.boardLists) : fetching = false;

  BoardTaskScreenState.fetching(BoardTaskScreenState state, this.fetching)
      : boardTask = state.boardTask,
        boardLists = state.boardLists;
}
