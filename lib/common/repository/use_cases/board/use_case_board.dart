import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseBoard extends UseCaseBase implements IUseCaseBoard {
  @override
  Future<Board?> createBoard(String boardName, String? boardDescription) {
    return remoteDataManager.createBoard(Board.withUid(
      remoteDataManager.getCurrentUser()!.id,
      boardName,
      boardDescription,
    )..dateCreated = DateTime.now());
  }

  @override
  Future<bool> deleteBoard(String id) {
    return remoteDataManager.deleteBoard(id);
  }

  @override
  Future<Board?> fetchBoard(String id) {
    return remoteDataManager.fetchBoard(id);
  }

  @override
  Future<List<Board>> fetchBoards() {
    return remoteDataManager.fetchBoards();
  }

  @override
  Future<Board?> updateBoard(Board board) {
    return remoteDataManager.updateBoard(board);
  }
}
