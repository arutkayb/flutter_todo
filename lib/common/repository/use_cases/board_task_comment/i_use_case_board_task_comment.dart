import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';

abstract class IUseCaseBoardTaskComment {
  Future<BoardTaskComment?> createBoardTaskComment(
      String boardId, String boardTaskId, String content);

  Future<List<BoardTaskComment>> fetchBoardTaskComments(
      String boardId, String boardTaskId);

  Future<BoardTaskComment?> fetchBoardTaskComment(
      String boardId, String boardTaskId, String id);

  Future<BoardTaskComment?> updateBoardTaskComment(
      BoardTaskComment boardTaskComment);

  Future<bool> deleteBoardTaskComment(BoardTaskComment boardTaskComment);
}
