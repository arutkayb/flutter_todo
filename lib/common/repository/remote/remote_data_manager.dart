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
import 'package:flutter_starter/common/repository/remote/util/firebase_util.dart';
import 'package:flutter_starter/common/repository/remote/util/remote_data_path_util.dart';

class RemoteDataManager implements IRemoteDataManager {
  final dio = Dio();
  final DatabaseReference _ref;
  final RemoteDataPathUtil _remoteDataPathUtil;

  RemoteDataManager(String rootDirectory)
      : _ref = FirebaseDatabase.instance.ref(),
        _remoteDataPathUtil = RemoteDataPathUtil(rootDirectory);

  @override
  Future<void> removeDirectory(String directory) async {
    final ref = _ref.child(directory);
    await ref.set(null);
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
  Future<Board?> createBoard(Board board) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardsPath()).child(board.id);
    await ref.set(board.toJson());

    return fetchBoard(board.id);
  }

  @override
  Future<List<Board>> fetchBoards() async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardsPath());

    // get current user's boards
    Query query = ref.orderByChild("userId").equalTo(getCurrentUser()!.id);
    final snapshot = await query.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final List<Board> list = List.empty(growable: true);
      for (var element in snapshot.children) {
        list.add(Board.fromJson(getMapFromSnapshot(element)));
      }
      return list;
    } else {
      return List.empty();
    }
  }

  @override
  Future<Board?> fetchBoard(String id) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardsPath());
    final snapshot = await ref.child(id).get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final board = Board.fromJson(getMapFromSnapshot(snapshot));
      return board;
    } else {
      return null;
    }
  }

  @override
  Future<Board?> updateBoard(Board board) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardsPath()).child(board.id);
    await ref.update(board.toJson());

    return fetchBoard(board.id);
  }

  @override
  Future<bool> deleteBoard(String id) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardsPath()).child(id);
    await ref.set(null);

    return (await fetchBoard(id)) == null;
  }

  @override
  Future<BoardList?> createBoardList(BoardList boardList) {
    throw UnimplementedError();
  }

  @override
  Future<List<BoardList>> fetchBoardLists(String boardId) {
    throw UnimplementedError();
  }

  @override
  Future<BoardList?> fetchBoardList(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BoardList?> updateBoardList(BoardList boardList) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardList(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> createBoardTask(BoardTask boardTask) {
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTask>> fetchBoardTasks(String boardId) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> fetchBoardTask(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTask?> updateBoardTask(BoardTask boardTask) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTask(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> createBoardTaskComment(
      BoardTaskComment boardTaskComment) {
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTaskComment>> fetchBoardTaskComments(String boardTaskId) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> fetchBoardTaskComment(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskComment?> updateBoardTaskComment(
      BoardTaskComment boardTaskComment) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTaskComment(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(String boardTaskId) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> fetchBoardTaskAlarm(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTaskAlarm(String id) {
    throw UnimplementedError();
  }
}
