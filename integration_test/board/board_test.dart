import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/setup_helper.dart';
import '../helper/user_helper.dart';

void main() async {
  await setupTestDependencies();

  IUseCaseBoard useCaseBoard = locator.get<IUseCaseBoard>();

  final uid = generateUid();
  const boardName = "Created Board";
  const boardDescription = "Created Board Description";

  Future<Board?> createBoard() async {
    final user = getCurrentUser();

    Board newBoard = Board(uid, user.id)
      ..name = boardName
      ..description = boardDescription;

    return await useCaseBoard.createBoard(newBoard);
  }

  test("createBoard", () async {
    final created = await createBoard();

    assert(created != null);
    assert(created?.id == uid);
    assert(created?.name == boardName);
    assert(created?.description == boardDescription);
  });

  test("fetchBoard", () async {
    await createBoard();

    final board = await useCaseBoard.fetchBoard(uid);
    assert(board != null);
    assert(board?.id == uid);
  });

  test("fetchBoards", () async {
    await createBoard();

    List<Board> boards = await useCaseBoard.fetchBoards();
    assert(boards.length == 1);
    assert(boards[0].id == uid);
  });

  test("updateBoard", () async {
    await createBoard();

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
    await createBoard();

    final board = await useCaseBoard.fetchBoard(uid);
    assert(board != null);

    bool deleted = await useCaseBoard.deleteBoard(board!.id);
    assert(deleted);
  });
}
