import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseBoardList extends UseCaseBase implements IUseCaseBoardList {
  @override
  Future<BoardList> createBoardList(BoardList boardList) {
    // TODO: implement createBoardList
    throw UnimplementedError();
  }

  @override
  Future<BoardTask> createBoardTask(BoardTask boardTask) {
    // TODO: implement createBoardTask
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardList(String id) {
    // TODO: implement deleteBoardList
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTask(String id) {
    // TODO: implement deleteBoardTask
    throw UnimplementedError();
  }

  @override
  Future<BoardList> fetchBoardList(String id) {
    // TODO: implement fetchBoardList
    throw UnimplementedError();
  }

  @override
  Future<List<BoardList>> fetchBoardLists(Board board) {
    // TODO: implement fetchBoardLists
    throw UnimplementedError();
  }

  @override
  Future<BoardTask> fetchBoardTask(String id) {
    // TODO: implement fetchBoardTask
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTask>> fetchBoardTasks(Board board) {
    // TODO: implement fetchBoardTasks
    throw UnimplementedError();
  }

  @override
  Future<BoardList> updateBoardList(BoardList boardList) {
    // TODO: implement updateBoardList
    throw UnimplementedError();
  }

  @override
  Future<BoardTask> updateBoardTask(BoardTask boardTask) {
    // TODO: implement updateBoardTask
    throw UnimplementedError();
  }
}
