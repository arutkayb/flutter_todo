import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';

void run() {
  IUseCaseBoardList useCaseBoardList = locator.get<IUseCaseBoardList>();

  final uid = generateUid();
  const boardListName = "Created BoardList";

  test("createBoardList and fetchBoardLists", () async {
    final board = await createBoard();

    BoardList newBoardList = BoardList(uid, board.id)..name = boardListName;
    final created = await useCaseBoardList.createBoardList(newBoardList);

    assert(created != null);
    assert(created?.id == uid);
    assert(created?.boardId == board.id);
    assert(created?.name == boardListName);

    List<BoardList> boardLists = await useCaseBoardList.fetchBoardLists(board);
    assert(boardLists.length == 1);
    assert(boardLists[0].id == uid);
  });

  test("fetchBoardList", () async {
    final boardList = await useCaseBoardList.fetchBoardList(uid);
    assert(boardList != null);
    assert(boardList?.id == uid);
  });

  test("updateBoardList", () async {
    final boardList = await useCaseBoardList.fetchBoardList(uid);
    assert(boardList != null);

    const newBoardListName = "New BoardList Name";
    boardList?.name = newBoardListName;

    final updatedBoardList = await useCaseBoardList.updateBoardList(boardList!);

    assert(updatedBoardList?.name == newBoardListName);
  });

  test("deleteBoardList", () async {
    final boardList = await useCaseBoardList.fetchBoardList(uid);
    assert(boardList != null);

    bool deleted = await useCaseBoardList.deleteBoardList(boardList!.id);
    assert(deleted);
  });
}
