import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseBoardTaskComment extends UseCaseBase
    implements IUseCaseBoardTaskComment {
  @override
  Future<BoardTaskComment?> createBoardTaskComment(
      BoardTaskComment boardTaskComment) {
    return remoteDataManager.createBoardTaskComment(boardTaskComment);
  }

  @override
  Future<bool> deleteBoardTaskComment(BoardTaskComment boardTaskComment) {
    return remoteDataManager.deleteBoardTaskComment(boardTaskComment);
  }

  @override
  Future<BoardTaskComment?> fetchBoardTaskComment(
      String boardId, String boardTaskId, String id) {
    return remoteDataManager.fetchBoardTaskComment(boardId, boardTaskId, id);
  }

  @override
  Future<List<BoardTaskComment>> fetchBoardTaskComments(
      String boardId, String boardTaskId) {
    return remoteDataManager.fetchBoardTaskComments(boardId, boardTaskId);
  }

  @override
  Future<BoardTaskComment?> updateBoardTaskComment(
      BoardTaskComment boardTaskComment) {
    return remoteDataManager.updateBoardTaskComment(boardTaskComment);
  }
}
