import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class MockUseCaseBoardTaskComment extends UseCaseBase
    implements IUseCaseBoardTaskComment {
  @override
  Future<BoardTaskComment?> createBoardTaskComment(BoardTaskComment board) {
    // TODO: implement createBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTaskComment(String id) {
    // TODO: implement deleteBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> fetchBoardTaskComment(String id) {
    // TODO: implement fetchBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTaskComment>> fetchBoardTaskComments(BoardTask boardTask) {
    // TODO: implement fetchBoardTaskComments
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> updateBoardTaskComment(BoardTaskComment board) {
    // TODO: implement updateBoardTaskComment
    throw UnimplementedError();
  }
}
