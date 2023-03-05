import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class MockUseCaseBoardTask extends UseCaseBase implements IUseCaseBoardTask {
  @override
  Future<BoardTask?> createBoardTask(BoardTask boardTask) {
    // TODO: implement createBoardTask
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTask(BoardTask boardTask) {
    // TODO: implement deleteBoardTask
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> fetchBoardTask(String boardId, String id) {
    // TODO: implement fetchBoardTask
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTask>> fetchBoardTasks(String boardId) {
    // TODO: implement fetchBoardTasks
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> updateBoardTask(BoardTask boardTask) {
    // TODO: implement updateBoardTask
    throw UnimplementedError();
  }
  
}
