import 'package:flutter_starter/common/models/board_task_comment.dart';

class TaskCommentState {
  bool fetching;
  List<BoardTaskComment>? comments;

  TaskCommentState([this.comments]) : fetching = false;

  TaskCommentState.fetching(TaskCommentState state, this.fetching)
      : comments = state.comments;
}
