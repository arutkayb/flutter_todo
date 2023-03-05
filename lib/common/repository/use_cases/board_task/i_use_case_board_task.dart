import 'package:flutter_starter/common/models/board_task.dart';

abstract class IUseCaseBoardTask {
  Future<BoardTask?> createBoardTask(BoardTask boardTask);

  Future<List<BoardTask>> fetchBoardTasks(String boardId);

  Future<BoardTask?> fetchBoardTask(String boardId, String id);

  Future<BoardTask?> updateBoardTask(BoardTask boardTask);

  Future<bool> deleteBoardTask(BoardTask boardTask);
}
