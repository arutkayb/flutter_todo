import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';

void run() {
  IUseCaseBoardTask useCaseBoardTask = locator.get<IUseCaseBoardTask>();

  final boardTaskId = generateUid();
  final boardListId = generateUid();
  final boardId = generateUid();

  const boardTaskTitle = "Created BoardTask";

  test("createBoardTask and fetchBoardTasks", () async {
    final board = await createBoard(boardId);
    final boardList = await createBoardList(board, boardListId);

    BoardTask newBoardTask =
        BoardTask(boardTaskId, boardList.boardId, boardList.id)
          ..title = boardTaskTitle;
    final created = await useCaseBoardTask.createBoardTask(newBoardTask);

    assert(created != null);
    assert(created?.id == boardTaskId);
    assert(created?.boardListId == boardList.id);
    assert(created?.boardId == board.id);
    assert(created?.title == boardTaskTitle);

    List<BoardTask> boardTasks =
        await useCaseBoardTask.fetchBoardTasks(board.id, boardList.id);
    assert(boardTasks.length == 1);
    assert(boardTasks[0].id == boardTaskId);
  });

  test("fetchBoardTask", () async {
    final boardTask = await useCaseBoardTask.fetchBoardTask(
        boardId, boardListId, boardTaskId);
    assert(boardTask != null);
    assert(boardTask?.id == boardTaskId);
    assert(boardTask?.boardId == boardId);
    assert(boardTask?.boardListId == boardListId);
  });

  test("updateBoardTask", () async {
    final boardTask = await useCaseBoardTask.fetchBoardTask(
        boardId, boardListId, boardTaskId);
    assert(boardTask != null);

    const newBoardTaskTitle = "New BoardTask Name";
    boardTask?.title = newBoardTaskTitle;

    final updatedBoardTask = await useCaseBoardTask.updateBoardTask(boardTask!);

    assert(updatedBoardTask?.title == newBoardTaskTitle);
  });

  test("deleteBoardTask", () async {
    final BoardTask? boardTask = await useCaseBoardTask.fetchBoardTask(
        boardId, boardListId, boardTaskId);
    assert(boardTask != null);

    bool deleted = await useCaseBoardTask.deleteBoardTask(boardTask!);
    assert(deleted);
  });
}
