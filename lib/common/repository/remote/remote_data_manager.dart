import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_core/firebase_core.dart';
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
import 'package:flutter_starter/firebase_options.dart';

class RemoteDataManager implements IRemoteDataManager {
  final dio = Dio();
  late final DatabaseReference _ref;
  final RemoteDataPathUtil _remoteDataPathUtil;

  RemoteDataManager(String rootDirectory)
      : _remoteDataPathUtil = RemoteDataPathUtil(rootDirectory);

  @override
  Future<void> initialize() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final FirebaseDatabase firebaseInstance = FirebaseDatabase.instance;
    _ref = firebaseInstance.ref();
  }

  @override
  Future<void> removeDirectory(String directory) async {
    final ref = _ref.child(directory);
    await ref.set(null);
  }

  @override
  Future<Map<String, dynamic>> exportData() async {
    Map<String, dynamic> res = {
      _remoteDataPathUtil.boardsDirectory: await _fetchAllBoards(),
      _remoteDataPathUtil.boardTaskCommentsDirectory:
          await _fetchAllBoardTaskComments(),
      _remoteDataPathUtil.boardTaskAlarmsDirectory:
          await _fetchAllBoardTaskAlarms(),
      _remoteDataPathUtil.usersDirectory: await _fetchAllUsers()
    };

    return res;
  }

  Future<Map<dynamic, dynamic>> _fetchAllBoards() async {
    final ref = _ref.child(_remoteDataPathUtil.boardsDirectory);

    try {
      final snapshot = await ref.get();

      if (snapshot.exists && snapshot.children.isNotEmpty) {
        return snapshot.value as Map<dynamic, dynamic>;
      }
    } catch (e) {
      print(e.toString());
    }

    return {};
  }

  Future<Map<dynamic, dynamic>> _fetchAllBoardTaskComments() async {
    final ref = _ref.child(_remoteDataPathUtil.boardTaskCommentsDirectory);

    try {
      final snapshot = await ref.get();

      if (snapshot.exists && snapshot.children.isNotEmpty) {
        return snapshot.value as Map<dynamic, dynamic>;
      }
    } catch (e) {
      print(e.toString());
    }

    return {};
  }

  Future<Map<dynamic, dynamic>> _fetchAllBoardTaskAlarms() async {
    final ref = _ref.child(_remoteDataPathUtil.boardTaskAlarmsDirectory);

    try {
      final snapshot = await ref.get();

      if (snapshot.exists && snapshot.children.isNotEmpty) {
        return snapshot.value as Map<dynamic, dynamic>;
      }
    } catch (e) {
      print(e.toString());
    }

    return {};
  }

  Future<Map<dynamic, dynamic>> _fetchAllUsers() async {
    final ref = _ref.child(_remoteDataPathUtil.usersDirectory);

    try {
      final snapshot = await ref.get();

      if (snapshot.exists && snapshot.children.isNotEmpty) {
        return snapshot.value as Map<dynamic, dynamic>;
      }
    } catch (e) {
      print(e.toString());
    }

    return {};
  }

  @override
  Future<User> createUser(User user) async {
    final ref = _ref.child(_remoteDataPathUtil.getUserPath(user.id));
    await ref.set(user.toJson());

    return user;
  }

  @override
  Future<User> createUserWithEmail(String email, String password) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return await createUser(
        User(userCredential.user!.uid, userCredential.user!.email));
  }

  @override
  Future<bool> signInWithEmail(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return true;
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
  Future<List<User>> getUsers() async {
    final ref = _ref.child(_remoteDataPathUtil.getUsersPath());

    try {
      final snapshot = await ref.get();

      if (snapshot.exists && snapshot.children.isNotEmpty) {
        final List<User> list = List.empty(growable: true);
        for (var element in snapshot.children) {
          final user = User.fromJson(getMapFromSnapshot(element));

          list.add(user);
        }
        return list;
      } else {
        return List.empty();
      }
    } catch (e) {
      print(e.toString());
      return List.empty();
    }
  }

  @override
  Future<Board?> createBoard(Board board) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardPath(board.id));
    await ref.set(board.toJson());

    return fetchBoard(board.id);
  }

  @override
  Future<List<Board>> fetchBoards() async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardsPath());

    try {
      final snapshot = await ref.get();

      if (snapshot.exists && snapshot.children.isNotEmpty) {
        final List<Board> list = List.empty(growable: true);
        for (var element in snapshot.children) {
          final board = Board.fromJson(getMapFromSnapshot(element));

          list.add(board);
        }
        return list;
      } else {
        return List.empty();
      }
    } catch (e) {
      print(e.toString());
      return List.empty();
    }
  }

  @override
  Future<Board?> fetchBoard(String id) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardPath(id));
    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final board = Board.fromJson(getMapFromSnapshot(snapshot));
      return board;
    } else {
      return null;
    }
  }

  @override
  Future<Board?> updateBoard(Board board) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardPath(board.id));
    await ref.update(board.toJson());

    return fetchBoard(board.id);
  }

  @override
  Future<bool> deleteBoard(String id) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardPath(id));
    await ref.set(null);

    return (await fetchBoard(id)) == null;
  }

  @override
  Future<BoardList?> createBoardList(BoardList boardList) async {
    final ref = _ref.child(
        _remoteDataPathUtil.getBoardListPath(boardList.boardId, boardList.id));
    await ref.set(boardList.toJson());

    return fetchBoardList(boardList.boardId, boardList.id);
  }

  @override
  Future<List<BoardList>> fetchBoardLists(String boardId) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardListsPath(boardId));
    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final List<BoardList> list = List.empty(growable: true);
      for (var element in snapshot.children) {
        list.add(BoardList.fromJson(getMapFromSnapshot(element)));
      }
      return list;
    } else {
      return List.empty();
    }
  }

  @override
  Future<BoardList?> fetchBoardList(String boardId, String boardListId) async {
    final ref =
        _ref.child(_remoteDataPathUtil.getBoardListPath(boardId, boardListId));
    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final boardList = BoardList.fromJson(getMapFromSnapshot(snapshot));
      return boardList;
    } else {
      return null;
    }
  }

  @override
  Future<BoardList?> updateBoardList(BoardList boardList) async {
    final ref = _ref.child(
        _remoteDataPathUtil.getBoardListPath(boardList.boardId, boardList.id));
    await ref.update(boardList.toJson());

    return fetchBoardList(boardList.boardId, boardList.id);
  }

  @override
  Future<bool> deleteBoardList(String boardId, String id) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardListPath(boardId, id));
    await ref.set(null);

    return (await fetchBoardList(boardId, id)) == null;
  }

  @override
  Future<BoardTask?> createBoardTask(BoardTask boardTask) async {
    if (boardTask.id == null) {
      return null;
    }

    final ref = _ref.child(
        _remoteDataPathUtil.getBoardTaskPath(boardTask.boardId, boardTask.id!));
    await ref.set(boardTask.toJson());

    return fetchBoardTask(boardTask.boardId, boardTask.id!);
  }

  @override
  Future<List<BoardTask>> fetchBoardTasks(String boardId) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTasksPath(boardId));

    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final List<BoardTask> list = List.empty(growable: true);
      for (var element in snapshot.children) {
        list.add(BoardTask.fromJson(getMapFromSnapshot(element)));
      }
      return list;
    } else {
      return List.empty();
    }
  }

  @override
  Future<BoardTask?> fetchBoardTask(String boardId, String id) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTaskPath(boardId, id));
    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final boardTask = BoardTask.fromJson(getMapFromSnapshot(snapshot));
      return boardTask;
    } else {
      return null;
    }
  }

  @override
  Future<BoardTask?> updateBoardTask(BoardTask boardTask) async {
    if (boardTask.id == null) {
      return null;
    }

    final ref = _ref.child(
        _remoteDataPathUtil.getBoardTaskPath(boardTask.boardId, boardTask.id!));
    await ref.update(boardTask.toJson());

    return fetchBoardTask(boardTask.boardId, boardTask.id!);
  }

  @override
  Future<bool> deleteBoardTask(BoardTask boardTask) async {
    if (boardTask.id == null) {
      return false;
    }

    final ref = _ref.child(
        _remoteDataPathUtil.getBoardTaskPath(boardTask.boardId, boardTask.id!));
    await ref.set(null);

    return (await fetchBoardTask(boardTask.boardId, boardTask.id!)) == null;
  }

  @override
  Future<BoardTaskComment?> createBoardTaskComment(
      BoardTaskComment boardTaskComment) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTaskCommentPath(
        boardTaskComment.boardId,
        boardTaskComment.boardTaskId,
        boardTaskComment.id));
    await ref.set(boardTaskComment.toJson());

    return fetchBoardTaskComment(boardTaskComment.boardId,
        boardTaskComment.boardTaskId, boardTaskComment.id);
  }

  @override
  Future<List<BoardTaskComment>> fetchBoardTaskComments(
      String boardId, String boardTaskId) async {
    final ref = _ref.child(
        _remoteDataPathUtil.getBoardTaskCommentsPath(boardId, boardTaskId));

    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final List<BoardTaskComment> list = List.empty(growable: true);
      for (var element in snapshot.children) {
        list.add(BoardTaskComment.fromJson(getMapFromSnapshot(element)));
      }
      return list;
    } else {
      return List.empty();
    }
  }

  @override
  Future<BoardTaskComment?> fetchBoardTaskComment(
      String boardId, String boardTaskId, String id) async {
    final ref = _ref.child(
        _remoteDataPathUtil.getBoardTaskCommentPath(boardId, boardTaskId, id));
    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final boardTaskComment =
          BoardTaskComment.fromJson(getMapFromSnapshot(snapshot));
      return boardTaskComment;
    } else {
      return null;
    }
  }

  @override
  Future<BoardTaskComment?> updateBoardTaskComment(
      BoardTaskComment boardTaskComment) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTaskCommentPath(
        boardTaskComment.boardId,
        boardTaskComment.boardTaskId,
        boardTaskComment.id));
    await ref.update(boardTaskComment.toJson());

    return fetchBoardTaskComment(boardTaskComment.boardId,
        boardTaskComment.boardTaskId, boardTaskComment.id);
  }

  @override
  Future<bool> deleteBoardTaskComment(BoardTaskComment boardTaskComment) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTaskCommentPath(
        boardTaskComment.boardId,
        boardTaskComment.boardTaskId,
        boardTaskComment.id));
    await ref.set(null);

    return (await fetchBoardTaskComment(boardTaskComment.boardId,
            boardTaskComment.boardTaskId, boardTaskComment.id)) ==
        null;
  }

  @override
  Future<BoardTaskAlarm?> createBoardTaskAlarm(
      BoardTaskAlarm boardTaskAlarm) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTaskAlarmPath(
        boardTaskAlarm.boardId, boardTaskAlarm.boardTaskId, boardTaskAlarm.id));
    await ref.set(boardTaskAlarm.toJson());

    return fetchBoardTaskAlarm(
        boardTaskAlarm.boardId, boardTaskAlarm.boardTaskId, boardTaskAlarm.id);
  }

  @override
  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(
      String boardId, String boardTaskId) async {
    final ref = _ref.child(
        _remoteDataPathUtil.getBoardTaskAlarmsPath(boardId, boardTaskId));

    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final List<BoardTaskAlarm> list = List.empty(growable: true);
      for (var element in snapshot.children) {
        list.add(BoardTaskAlarm.fromJson(getMapFromSnapshot(element)));
      }
      return list;
    } else {
      return List.empty();
    }
  }

  @override
  Future<BoardTaskAlarm?> fetchBoardTaskAlarm(
      String boardId, String boardTaskId, String id) async {
    final ref = _ref.child(
        _remoteDataPathUtil.getBoardTaskAlarmPath(boardId, boardTaskId, id));
    final snapshot = await ref.get();

    if (snapshot.exists && snapshot.children.isNotEmpty) {
      final boardTaskAlarm =
          BoardTaskAlarm.fromJson(getMapFromSnapshot(snapshot));
      return boardTaskAlarm;
    } else {
      return null;
    }
  }

  @override
  Future<BoardTaskAlarm?> updateBoardTaskAlarm(
      BoardTaskAlarm boardTaskAlarm) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTaskAlarmPath(
        boardTaskAlarm.boardId, boardTaskAlarm.boardTaskId, boardTaskAlarm.id));
    await ref.update(boardTaskAlarm.toJson());

    return fetchBoardTaskAlarm(
        boardTaskAlarm.boardId, boardTaskAlarm.boardTaskId, boardTaskAlarm.id);
  }

  @override
  Future<bool> deleteBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) async {
    final ref = _ref.child(_remoteDataPathUtil.getBoardTaskAlarmPath(
        boardTaskAlarm.boardId, boardTaskAlarm.boardTaskId, boardTaskAlarm.id));
    await ref.set(null);

    return (await fetchBoardTaskAlarm(boardTaskAlarm.boardId,
            boardTaskAlarm.boardTaskId, boardTaskAlarm.id)) ==
        null;
  }
}
