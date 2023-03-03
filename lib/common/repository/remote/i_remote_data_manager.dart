import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/models/user.dart';

abstract class IRemoteDataManager {
  // User
  Future<bool> createUserWithEmail(String email, String password);

  Future<bool> signInWithEmail(String email, String password);

  Future<bool> deleteCurrentUser();

  Future<User?> getCurrentUser();

  Future<bool> isUserLoggedIn();

  Future<void> logout();

  // Board
  Future<Board> createBoard(Board board);

  Future<List<Board>> fetchBoards(String userId);

  Future<Board> fetchBoard(String id);

  Future<Board> updateBoard(Board board);

  Future<bool> deleteBoard(String id);

  // BoardList
  Future<BoardList> createBoardList(BoardList boardList);

  Future<List<BoardList>> fetchBoardLists(String boardId);

  Future<BoardList> fetchBoardList(String id);

  Future<BoardList> updateBoardList(BoardList boardList);

  Future<bool> deleteBoardList(String id);

  // BoardTask
  Future<BoardTask> createBoardTask(BoardTask boardTask);

  Future<List<BoardTask>> fetchBoardTasks(String boardId);

  Future<BoardTask> fetchBoardTask(String id);

  Future<BoardTask> updateBoardTask(BoardTask boardTask);

  Future<bool> deleteBoardTask(String id);

  // BoardTaskComment
  Future<BoardTaskComment> createBoardTaskComment(
      BoardTaskComment boardTaskComment);

  Future<List<BoardTaskComment>> fetchBoardTaskComments(String boardTaskId);

  Future<BoardTaskComment> fetchBoardTaskComment(String id);

  Future<BoardTaskComment> updateBoardTaskComment(
      BoardTaskComment boardTaskComment);

  Future<bool> deleteBoardTaskComment(String id);

  // BoardTaskAlarm
  Future<BoardTaskAlarm> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm);

  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(String boardTaskId);

  Future<BoardTaskAlarm> fetchBoardTaskAlarm(String id);

  Future<BoardTaskAlarm> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm);

  Future<bool> deleteBoardTaskAlarm(String id);
}
