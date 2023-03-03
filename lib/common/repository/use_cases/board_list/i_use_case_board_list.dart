import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';

abstract class IUseCaseBoardList {
  Future<BoardList?> createBoardList(BoardList boardList);

  Future<List<BoardList>> fetchBoardLists(Board board);

  Future<BoardList?> fetchBoardList(String boardId, String id);

  Future<BoardList?> updateBoardList(BoardList boardList);

  Future<bool> deleteBoardList(BoardList boardList);
}
