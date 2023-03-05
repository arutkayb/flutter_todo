import 'package:flutter_starter/common/models/board_task_comment.dart';

abstract class TaskCommentEvent {
  String boardId;
  String boardTaskId;

  TaskCommentEvent(this.boardId, this.boardTaskId);
}

class FetchTaskComments extends TaskCommentEvent {
  FetchTaskComments(super.boardId, super.boardTaskId);
}

class CreateNewComment extends TaskCommentEvent {
  String content;

  CreateNewComment(super.boardId, super.boardTaskId, this.content);
}

class DeleteTaskComment extends TaskCommentEvent {
  BoardTaskComment taskComment;

  DeleteTaskComment(this.taskComment)
      : super(
          taskComment.boardId,
          taskComment.boardTaskId,
        );
}
