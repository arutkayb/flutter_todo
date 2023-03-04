import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';
import '../helper/setup_helper.dart';
import '../helper/user_helper.dart';

void main() async {
  await setupTestDependencies();

  IUseCaseBoardTask useCaseBoardTask = locator.get<IUseCaseBoardTask>();

  final boardTaskId = generateUid();
  final boardListId = generateUid();
  final boardId = generateUid();

  const boardTaskTitle = "Created BoardTask";

  Future<BoardTask?> createBoardTask() async {
    final board = await createBoard(boardId);
    final boardList = await createBoardList(board, boardListId);

    BoardTask newBoardTask =
        BoardTask(boardTaskId, boardList.boardId, boardList.id)
          ..title = boardTaskTitle;
    return await useCaseBoardTask.createBoardTask(newBoardTask);
  }

  test("createBoardTask", () async {
    final created = await createBoardTask();

    assert(created != null);
    assert(created?.id == boardTaskId);
    assert(created?.boardListId == boardListId);
    assert(created?.boardId == boardId);
    assert(created?.title == boardTaskTitle);
  });

  test("fetchBoardTasks", () async {
    await createBoardTask();

    List<BoardTask> boardTasks =
        await useCaseBoardTask.fetchBoardTasks(boardId, boardListId);
    assert(boardTasks.length == 1);
    assert(boardTasks[0].id == boardTaskId);
  });

  test("fetchBoardTask", () async {
    await createBoardTask();

    final boardTask = await useCaseBoardTask.fetchBoardTask(
        boardId, boardListId, boardTaskId);
    assert(boardTask != null);
    assert(boardTask?.id == boardTaskId);
    assert(boardTask?.boardId == boardId);
    assert(boardTask?.boardListId == boardListId);
  });

  test("updateBoardTask", () async {
    await createBoardTask();

    final boardTask = await useCaseBoardTask.fetchBoardTask(
        boardId, boardListId, boardTaskId);
    assert(boardTask != null);

    const newBoardTaskTitle = "New BoardTask Name";
    boardTask?.title = newBoardTaskTitle;

    final updatedBoardTask = await useCaseBoardTask.updateBoardTask(boardTask!);

    assert(updatedBoardTask?.title == newBoardTaskTitle);
  });

  test("deleteBoardTask", () async {
    await createBoardTask();

    final BoardTask? boardTask = await useCaseBoardTask.fetchBoardTask(
        boardId, boardListId, boardTaskId);
    assert(boardTask != null);

    bool deleted = await useCaseBoardTask.deleteBoardTask(boardTask!);
    assert(deleted);
  });
}
