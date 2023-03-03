import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/user_helper.dart';

void run() {
  IUseCaseBoard useCaseBoard = locator.get<IUseCaseBoard>();

  final user = getCurrentUser();

  final uid = generateUid();
  const boardName = "Created Board";
  const boardDescription = "Created Board Description";

  test("createBoard", () async {
    Board newBoard = Board(uid, user.id)
      ..name = boardName
      ..description = boardDescription;
    final created = await useCaseBoard.createBoard(newBoard);

    assert(created != null);
    assert(created?.id == uid);
    assert(created?.name == boardName);
    assert(created?.description == boardDescription);
  });

  test("fetchBoard", () async {
    final board = await useCaseBoard.fetchBoard(uid);
    assert(board != null);
    assert(board?.id == uid);
  });

  test("fetchBoards", () async {
    List<Board> boards = await useCaseBoard.fetchBoards();
    assert(boards.length == 1);
    assert(boards[0].id == uid);
  });

  test("updateBoard", () async {
    final board = await useCaseBoard.fetchBoard(uid);
    assert(board != null);

    const newBoardName = "New Board Name";
    const newBoardDescription = "New Board Description";
    board?.name = newBoardName;
    board?.description = newBoardDescription;

    final updatedBoard = await useCaseBoard.updateBoard(board!);

    assert(updatedBoard?.name == newBoardName);
    assert(updatedBoard?.description == newBoardDescription);
  });

  test("deleteBoard", () async {
    final board = await useCaseBoard.fetchBoard(uid);
    assert(board != null);

    bool deleted = await useCaseBoard.deleteBoard(board!.id);
    assert(deleted);
  });
}
