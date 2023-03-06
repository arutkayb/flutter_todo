import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/models/user.dart';

class ExtendedBoardTaskComment {
  BoardTaskComment boardTaskComment;
  User? commentUser;

  ExtendedBoardTaskComment(this.boardTaskComment, this.commentUser);
}