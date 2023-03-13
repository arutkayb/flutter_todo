import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';
import '../helper/setup_helper.dart';

void main() async {
  await setupTestDependencies();

  IUseCaseBoard useCaseBoard = locator.get<IUseCaseBoard>();

  const boardName = "Created Board";
  const boardDescription = "Created Board Description";

  Future<Board?> createBoard() async {
    return await useCaseBoard.createBoard(boardName, boardDescription);
  }

  test("createBoard", () async {
    final created = await createBoard();

    assert(created != null);
    assert(created?.name == boardName);
    assert(created?.description == boardDescription);
  });

  test("fetchBoard", () async {
    final created = await createBoard();

    final board = await useCaseBoard.fetchBoard(created!.id);
    assert(board != null);
    assert(board?.id == created.id);
  });

  test("fetchBoards", () async {
    final created = await createBoard();

    List<Board> boards = await useCaseBoard.fetchBoards();
    assert(boards.length == 1);
    assert(boards[0].id == created!.id);
  });

  test("fetchBoards with Lists and Tasks", () async {
    final created = await createBoard();
    assert(created != null);

    final boardList = await createBoardList(created!);
    assert(boardList.boardId == created.id);

    final boardTask = await createBoardTask(boardList);
    assert(boardTask.boardId == created.id);

    List<Board> boards = await useCaseBoard.fetchBoards();
    assert(boards.length == 1);
    assert(boards[0].id == created.id);
  });

  test("updateBoard", () async {
    final created = await createBoard();

    final board = await useCaseBoard.fetchBoard(created!.id);
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
    final created = await createBoard();

    final board = await useCaseBoard.fetchBoard(created!.id);
    assert(board != null);

    bool deleted = await useCaseBoard.deleteBoard(board!.id);
    assert(deleted);
  });
}
