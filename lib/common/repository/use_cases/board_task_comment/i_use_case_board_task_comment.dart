import 'package:flutter_starter/common/models/board.dart';

abstract class IUseCaseBoardTaskComment {
  Future<Board?> createBoard(Board board);

  Future<List<Board>> fetchBoards();

  Future<Board?> fetchBoard(String id);

  Future<Board?> updateBoard(Board board);

  Future<bool> deleteBoard(String id);
}
