import 'package:flutter_starter/board_task/models/extended_board_task_comment.dart';

class TaskCommentState {
  bool fetching;
  List<ExtendedBoardTaskComment>? comments;

  TaskCommentState([this.comments]) : fetching = false;

  TaskCommentState.fetching(TaskCommentState state, this.fetching)
      : comments = state.comments;
}
