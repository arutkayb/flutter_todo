import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';
import '../helper/setup_helper.dart';

void main() async {
  await setupTestDependencies();

  IUseCaseBoardList useCaseBoardList = locator.get<IUseCaseBoardList>();

  final uid = generateUid();
  const boardListName = "Created BoardList";
  final board = await createBoard();

  Future<BoardList?> createBoardList() async {
    BoardList newBoardList = BoardList(uid, board.id)..name = boardListName;
    return useCaseBoardList.createBoardList(newBoardList);
  }

  test("createBoardList", () async {
    final created = await createBoardList();

    assert(created != null);
    assert(created?.id == uid);
    assert(created?.boardId == board.id);
    assert(created?.name == boardListName);
  });

  test("fetchBoardLists", () async {
    await createBoardList();

    List<BoardList> boardLists = await useCaseBoardList.fetchBoardLists(board);
    assert(boardLists.length == 1);
    assert(boardLists[0].id == uid);
  });

  test("fetchBoardList", () async {
    await createBoardList();

    final boardList = await useCaseBoardList.fetchBoardList(board.id, uid);
    assert(boardList != null);
    assert(boardList?.id == uid);
  });

  test("updateBoardList", () async {
    await createBoardList();

    final boardList = await useCaseBoardList.fetchBoardList(board.id, uid);
    assert(boardList != null);

    const newBoardListName = "New BoardList Name";
    boardList?.name = newBoardListName;

    final updatedBoardList = await useCaseBoardList.updateBoardList(boardList!);

    assert(updatedBoardList?.name == newBoardListName);
  });

  test("deleteBoardList", () async {
    await createBoardList();

    final boardList = await useCaseBoardList.fetchBoardList(board.id, uid);
    assert(boardList != null);

    bool deleted = await useCaseBoardList.deleteBoardList(boardList!);
    assert(deleted);
  });
}
