import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';

class BoardTaskScreenState {
  bool? saving;
  BoardTask boardTask;
  List<BoardList> boardLists;

  BoardTaskScreenState(this.boardTask, this.boardLists);

  BoardTaskScreenState.saving(BoardTaskScreenState state, this.saving)
      : boardTask = state.boardTask,
        boardLists = state.boardLists;
}
