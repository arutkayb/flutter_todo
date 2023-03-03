import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';
import '../helper/user_helper.dart';

void run() {
  IUseCaseBoardTaskComment useCaseBoardTaskComment =
      locator.get<IUseCaseBoardTaskComment>();

  final uid = generateUid();
  const content = "Comment content";

  test("createBoardTaskComment and fetchBoardTaskComments", () async {
    final user = getCurrentUser();
    final board = await createBoard();
    final boardList = await createBoardList(board);
    final boardTask = await createBoardTask(boardList);

    BoardTaskComment newBoardTaskComment =
        BoardTaskComment(uid, boardTask.id, user.id)..content = content;
    final created = await useCaseBoardTaskComment
        .createBoardTaskComment(newBoardTaskComment);

    assert(created != null);
    assert(created?.id == uid);
    assert(created?.boardTaskId == boardTask.id);
    assert(created?.userId == user.id);
    assert(created?.content == content);

    List<BoardTaskComment> boardTaskComments =
        await useCaseBoardTaskComment.fetchBoardTaskComments(boardTask);
    assert(boardTaskComments.length == 1);
    assert(boardTaskComments[0].id == uid);
  });

  test("fetchBoardTaskComment", () async {
    final boardTaskComment =
        await useCaseBoardTaskComment.fetchBoardTaskComment(uid);
    assert(boardTaskComment != null);
    assert(boardTaskComment?.id == uid);
  });

  test("updateBoardTaskComment", () async {
    final boardTaskComment =
        await useCaseBoardTaskComment.fetchBoardTaskComment(uid);
    assert(boardTaskComment != null);

    const newBoardTaskCommentContent = "New Comment Content";
    boardTaskComment?.content = newBoardTaskCommentContent;

    final updatedBoardTaskComment =
        await useCaseBoardTaskComment.updateBoardTaskComment(boardTaskComment!);

    assert(updatedBoardTaskComment?.content == newBoardTaskCommentContent);
  });

  test("deleteBoardTaskComment", () async {
    final boardTaskComment =
        await useCaseBoardTaskComment.fetchBoardTaskComment(uid);
    assert(boardTaskComment != null);

    bool deleted = await useCaseBoardTaskComment
        .deleteBoardTaskComment(boardTaskComment!.id);
    assert(deleted);
  });
}
