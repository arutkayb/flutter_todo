import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseBoardTaskComment extends UseCaseBase
    implements IUseCaseBoardTaskComment {
  @override
  Future<Board> createBoard(Board board) {
    // TODO: implement createBoard
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoard(String id) {
    // TODO: implement deleteBoard
    throw UnimplementedError();
  }

  @override
  Future<Board> fetchBoard(String id) {
    // TODO: implement fetchBoard
    throw UnimplementedError();
  }

  @override
  Future<List<Board>> fetchBoards() {
    // TODO: implement fetchBoards
    throw UnimplementedError();
  }

  @override
  Future<Board> updateBoard(Board board) {
    // TODO: implement updateBoard
    throw UnimplementedError();
  }
}
