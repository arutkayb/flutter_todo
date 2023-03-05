import 'package:flutter_starter/common/models/board.dart';

abstract class IUseCaseBoard {
  Future<Board?> createBoard(String boardName, String? boardDescription);

  Future<List<Board>> fetchBoards();

  Future<Board?> fetchBoard(String id);

  Future<Board?> updateBoard(Board board);

  Future<bool> deleteBoard(String id);
}
