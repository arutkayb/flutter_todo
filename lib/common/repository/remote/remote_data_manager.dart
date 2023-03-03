import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';

class RemoteDataManager implements IRemoteDataManager {
  final dio = Dio();
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final DatabaseReference _ref;

  RemoteDataManager(String rootDirectory)
      : _ref = FirebaseDatabase.instance.ref(rootDirectory);

  @override
  Future<Board> createBoard(Board board) {
    throw UnimplementedError();
  }

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
  Future<BoardTaskAlarm> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    // TODO: implement createBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment> createBoardTaskComment(
      BoardTaskComment boardTaskComment) {
    // TODO: implement createBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoard(String id) {
    // TODO: implement deleteBoard
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
  Future<Board> fetchBoard(String id) {
    // TODO: implement fetchBoard
    throw UnimplementedError();
  }

  @override
  Future<BoardList> fetchBoardList(String id) {
    // TODO: implement fetchBoardList
    throw UnimplementedError();
  }

  @override
  Future<List<BoardList>> fetchBoardLists(String boardId) {
    // TODO: implement fetchBoardLists
    throw UnimplementedError();
  }

  @override
  Future<BoardTask> fetchBoardTask(String id) {
    // TODO: implement fetchBoardTask
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm> fetchBoardTaskAlarm(String id) {
    // TODO: implement fetchBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(String boardTaskId) {
    // TODO: implement fetchBoardTaskAlarms
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment> fetchBoardTaskComment(String id) {
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
  Future<List<Board>> fetchBoards(String userId) {
    // TODO: implement fetchBoards
    throw UnimplementedError();
  }

  @override
  Future<bool> createUserWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  @override
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  @override
  Future<bool> deleteCurrentUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser!.delete();
      return true;
    }

    return false;
  }

  @override
  bool isUserLoggedIn() {
    return (getCurrentUser()) != null;
  }

  @override
  Future<void> logout() async {
    return FirebaseAuth.instance.signOut();
  }

  @override
  User? getCurrentUser() {
    if (FirebaseAuth.instance.currentUser == null) {
      return null;
    }

    return User(FirebaseAuth.instance.currentUser!.uid,
        FirebaseAuth.instance.currentUser!.email);
  }

  @override
  Future<Board> updateBoard(Board board) {
    // TODO: implement updateBoard
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

  @override
  Future<BoardTaskAlarm> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    // TODO: implement updateBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment> updateBoardTaskComment(
      BoardTaskComment boardTaskComment) {
    // TODO: implement updateBoardTaskComment
    throw UnimplementedError();
  }

  @override
  Future<void> removeDirectory(String directory) async {
    // TODO: implement removeDirectory
  }
}
