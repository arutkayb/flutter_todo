import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';

import 'user_helper.dart';

IUseCaseBoard useCaseBoard = locator.get<IUseCaseBoard>();
IUseCaseBoardList useCaseBoardList = locator.get<IUseCaseBoardList>();
IUseCaseBoardTask useCaseBoardTask = locator.get<IUseCaseBoardTask>();

Future<BoardTask> createBoardTask(BoardList boardList) async {
  final uid = generateUid();
  const boardTaskTitle = "Created Board Task";

  BoardTask newBoardTask = BoardTask(uid, boardList.id)..title = boardTaskTitle;
  final created = await useCaseBoardTask.createBoardTask(newBoardTask);

  assert(created != null);
  assert(created?.id == uid);

  return newBoardTask;
}

Future<BoardList> createBoardList(Board board) async {
  final uid = generateUid();
  const boardListName = "Created Board List";

  BoardList newBoardList = BoardList(uid, board.id)..name = boardListName;

  final created = await useCaseBoardList.createBoardList(newBoardList);

  assert(created != null);
  assert(created?.id == uid);

  return newBoardList;
}

Future<Board> createBoard() async {
  final user = getCurrentUser();

  final uid = generateUid();
  const boardName = "Created Board";
  const boardDescription = "Created Board Description";

  Board newBoard = Board(uid, user.id)
    ..name = boardName
    ..description = boardDescription;
  final created = await useCaseBoard.createBoard(newBoard);

  assert(created != null);
  assert(created?.id == uid);

  return newBoard;
}

Future<bool> deleteBoard(Board board) async {
  return await useCaseBoard.deleteBoard(board.id);
}
