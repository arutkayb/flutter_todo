import 'package:flutter_starter/common/repository/remote/util/remote_data_path_util.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final randomDataRootDirectory = generateUid();

  final remoteDataPathUtil = RemoteDataPathUtil(randomDataRootDirectory);

  test('getBoardsPath', () {
    final expectedPath = "$randomDataRootDirectory/boards/";
    final boardPath = remoteDataPathUtil.getBoardsPath();

    assert(boardPath == expectedPath);
  });

  test('getBoardPath', () {
    final boardId = generateUid();

    final expectedPath = "$randomDataRootDirectory/boards/$boardId";
    final boardPath = remoteDataPathUtil.getBoardPath(boardId);

    assert(boardPath == expectedPath);
  });

  test('getBoardListsPath', () {
    final boardId = generateUid();

    final expectedPath = "$randomDataRootDirectory/boards/$boardId/boardLists/";
    final boardPath = remoteDataPathUtil.getBoardListsPath(boardId);

    assert(boardPath == expectedPath);
  });

  test('getBoardListPath', () {
    final boardId = generateUid();
    final boardListId = generateUid();

    final expectedPath =
        "$randomDataRootDirectory/boards/$boardId/boardLists/$boardListId";
    final boardPath = remoteDataPathUtil.getBoardListPath(boardId, boardListId);

    assert(boardPath == expectedPath);
  });

  test('getBoardTasksPath', () {
    final boardId = generateUid();

    final expectedPath = "$randomDataRootDirectory/boards/$boardId/boardTasks/";
    final boardPath =
        remoteDataPathUtil.getBoardTasksPath(boardId);

    assert(boardPath == expectedPath);
  });

  test('getBoardTaskPath', () {
    final boardId = generateUid();
    final boardTaskId = generateUid();

    final expectedPath =
        "$randomDataRootDirectory/boards/$boardId/boardTasks/$boardTaskId";
    final boardPath = remoteDataPathUtil.getBoardTaskPath(boardId, boardTaskId);

    assert(boardPath == expectedPath);
  });

  test('getBoardTaskAlarmsPath', () {
    final boardId = generateUid();
    final boardTaskId = generateUid();

    final expectedPath =
        "$randomDataRootDirectory/boardTaskAlarms/$boardId/$boardTaskId/";
    final boardPath =
        remoteDataPathUtil.getBoardTaskAlarmsPath(boardId, boardTaskId);

    assert(boardPath == expectedPath);
  });

  test('getBoardTaskAlarmPath', () {
    final boardId = generateUid();
    final boardTaskId = generateUid();
    final boardAlarmId = generateUid();

    final expectedPath =
        "$randomDataRootDirectory/boardTaskAlarms/$boardId/$boardTaskId/$boardAlarmId";
    final boardPath = remoteDataPathUtil.getBoardTaskAlarmPath(
        boardId, boardTaskId, boardAlarmId);

    assert(boardPath == expectedPath);
  });

  test('getBoardTaskCommentsPath', () {
    final boardId = generateUid();
    final boardTaskId = generateUid();

    final expectedPath =
        "$randomDataRootDirectory/boardTaskComments/$boardId/$boardTaskId/";
    final boardPath =
        remoteDataPathUtil.getBoardTaskCommentsPath(boardId, boardTaskId);

    assert(boardPath == expectedPath);
  });

  test('getBoardTaskCommentPath', () {
    final boardId = generateUid();
    final boardTaskId = generateUid();
    final boardTaskCommentId = generateUid();

    final expectedPath =
        "$randomDataRootDirectory/boardTaskComments/$boardId/$boardTaskId/$boardTaskCommentId";
    final boardPath = remoteDataPathUtil.getBoardTaskCommentPath(
        boardId, boardTaskId, boardTaskCommentId);

    assert(boardPath == expectedPath);
  });
}
