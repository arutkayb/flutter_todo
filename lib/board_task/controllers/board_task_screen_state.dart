import 'package:flutter_starter/common/models/board_task.dart';

class BoardTaskScreenState {
  bool fetching;
  BoardTask? boardTask;

  BoardTaskScreenState([this.boardTask]) : fetching = false;

  BoardTaskScreenState.fetching(BoardTaskScreenState state, this.fetching)
      : boardTask = state.boardTask;
}
