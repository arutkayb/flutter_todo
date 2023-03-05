import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseBoardTask extends UseCaseBase implements IUseCaseBoardTask {
  @override
  Future<BoardTask?> createBoardTask(BoardTask boardTask) {
    return remoteDataManager
        .createBoardTask(boardTask..dateCreated = DateTime.now());
  }

  @override
  Future<bool> deleteBoardTask(BoardTask boardTask) {
    return remoteDataManager.deleteBoardTask(boardTask);
  }

  @override
  Future<BoardTask?> fetchBoardTask(String boardId, String id) {
    return remoteDataManager.fetchBoardTask(boardId, id);
  }

  @override
  Future<List<BoardTask>> fetchBoardTasks(String boardId) {
    return remoteDataManager.fetchBoardTasks(boardId);
  }

  @override
  Future<BoardTask?> updateBoardTask(BoardTask boardTask) {
    return remoteDataManager.updateBoardTask(boardTask);
  }
}
