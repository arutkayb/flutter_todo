import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';

abstract class IUseCaseBoardTaskComment {
  Future<BoardTaskComment?> createBoardTaskComment(BoardTaskComment board);

  Future<List<BoardTaskComment>> fetchBoardTaskComments(BoardTask boardTask);

  Future<BoardTaskComment?> fetchBoardTaskComment(String id);

  Future<BoardTaskComment?> updateBoardTaskComment(BoardTaskComment board);

  Future<bool> deleteBoardTaskComment(String id);
}
