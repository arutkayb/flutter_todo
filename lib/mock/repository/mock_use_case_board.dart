import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class MockUseCaseBoard extends UseCaseBase implements IUseCaseBoard {
  @override
  Future<Board> createBoard(String boardName, String? boardDescription) {
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
