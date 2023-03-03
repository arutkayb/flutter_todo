import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_task.dart';

abstract class IUseCaseBoardTask {
  Future<BoardTask?> createBoardTask(BoardTask boardTask);

  Future<List<BoardTask>> fetchBoardTasks(Board board);

  Future<BoardTask?> fetchBoardTask(String id);

  Future<BoardTask?> updateBoardTask(BoardTask boardTask);

  Future<bool> deleteBoardTask(String id);
}
