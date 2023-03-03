import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';

class MockRemoteDataManager implements IRemoteDataManager {
  @override
  Future<Board?> createBoard(Board board) {
    // TODO: implement createBoard
    throw UnimplementedError();
  }

  @override
  Future<BoardList?> createBoardList(BoardList boardList) {
    // TODO: implement createBoardList
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> createBoardTask(BoardTask boardTask) {
    // TODO: implement createBoardTask
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    // TODO: implement createBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> createBoardTaskComment(BoardTaskComment boardTaskComment) {
    // TODO: implement createBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<bool> createUserWithEmail(String email, String password) {
    // TODO: implement createUserWithEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoard(String id) {
    // TODO: implement deleteBoard
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardList(String boardId, String id) {
    // TODO: implement deleteBoardList
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTask(String id) {
    // TODO: implement deleteBoardTask
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTaskAlarm(String id) {
    // TODO: implement deleteBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTaskComment(String id) {
    // TODO: implement deleteBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCurrentUser() {
    // TODO: implement deleteCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Board?> fetchBoard(String id) {
    // TODO: implement fetchBoard
    throw UnimplementedError();
  }

  @override
  Future<BoardList?> fetchBoardList(String boardId, String id) {
    // TODO: implement fetchBoardList
    throw UnimplementedError();
  }

  @override
  Future<List<BoardList>> fetchBoardLists(String boardId) {
    // TODO: implement fetchBoardLists
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> fetchBoardTask(String id) {
    // TODO: implement fetchBoardTask
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> fetchBoardTaskAlarm(String id) {
    // TODO: implement fetchBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(String boardTaskId) {
    // TODO: implement fetchBoardTaskAlarms
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> fetchBoardTaskComment(String id) {
    // TODO: implement fetchBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTaskComment>> fetchBoardTaskComments(String boardTaskId) {
    // TODO: implement fetchBoardTaskComments
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTask>> fetchBoardTasks(String boardId) {
    // TODO: implement fetchBoardTasks
    throw UnimplementedError();
  }

  @override
  Future<List<Board>> fetchBoards() {
    // TODO: implement fetchBoards
    throw UnimplementedError();
  }

  @override
  User? getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  bool isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> removeDirectory(String directory) {
    // TODO: implement removeDirectory
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Board?> updateBoard(Board board) {
    // TODO: implement updateBoard
    throw UnimplementedError();
  }

  @override
  Future<BoardList?> updateBoardList(BoardList boardList) {
    // TODO: implement updateBoardList
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> updateBoardTask(BoardTask boardTask) {
    // TODO: implement updateBoardTask
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    // TODO: implement updateBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> updateBoardTaskComment(BoardTaskComment boardTaskComment) {
    // TODO: implement updateBoardTaskComment
    throw UnimplementedError();
  }
  
}
