import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';

void run() {
  IUseCaseBoardTask useCaseBoardTask = locator.get<IUseCaseBoardTask>();

  final uid = generateUid();
  const boardTaskTitle = "Created BoardTask";

  test("createBoardTask and fetchBoardTasks", () async {
    final board = await createBoard();
    final boardList = await createBoardList(board);

    BoardTask newBoardTask = BoardTask(uid, boardList.id)..title = boardTaskTitle;
    final created = await useCaseBoardTask.createBoardTask(newBoardTask);

    assert(created != null);
    assert(created?.id == uid);
    assert(created?.boardListId == boardList.id);
    assert(created?.title == boardTaskTitle);

    List<BoardTask> boardTasks = await useCaseBoardTask.fetchBoardTasks(board);
    assert(boardTasks.length == 1);
    assert(boardTasks[0].id == uid);
  });

  test("fetchBoardTask", () async {
    final boardTask = await useCaseBoardTask.fetchBoardTask(uid);
    assert(boardTask != null);
    assert(boardTask?.id == uid);
  });

  test("updateBoardTask", () async {
    final boardTask = await useCaseBoardTask.fetchBoardTask(uid);
    assert(boardTask != null);

    const newBoardTaskTitle = "New BoardTask Name";
    boardTask?.title = newBoardTaskTitle;

    final updatedBoardTask = await useCaseBoardTask.updateBoardTask(boardTask!);

    assert(updatedBoardTask?.title == newBoardTaskTitle);
  });

  test("deleteBoardTask", () async {
    final boardTask = await useCaseBoardTask.fetchBoardTask(uid);
    assert(boardTask != null);

    bool deleted = await useCaseBoardTask.deleteBoardTask(boardTask!.id);
    assert(deleted);
  });
}
