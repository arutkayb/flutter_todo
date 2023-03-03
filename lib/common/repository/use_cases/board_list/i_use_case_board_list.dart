import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';

abstract class IUseCaseBoardList {
  Future<BoardList?> createBoardList(BoardList boardList);

  Future<List<BoardList>> fetchBoardLists(Board board);

  Future<BoardList?> fetchBoardList(String id);

  Future<BoardList?> updateBoardList(BoardList boardList);

  Future<bool> deleteBoardList(String id);

  Future<BoardTask?> createBoardTask(BoardTask boardTask);

  Future<List<BoardTask>> fetchBoardTasks(Board board);

  Future<BoardTask?> fetchBoardTask(String id);

  Future<BoardTask?> updateBoardTask(BoardTask boardTask);

  Future<bool> deleteBoardTask(String id);
}
