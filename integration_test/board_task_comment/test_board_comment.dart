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

  final boardTaskCommentId = generateUid();
  final boardTaskId = generateUid();
  final boardId = generateUid();
  const content = "Comment content";

  test("createBoardTaskComment and fetchBoardTaskComments", () async {
    final user = getCurrentUser();
    final board = await createBoard(boardId);
    final boardList = await createBoardList(board);
    final boardTask = await createBoardTask(boardList, boardTaskId);

    BoardTaskComment newBoardTaskComment =
        BoardTaskComment(boardTaskCommentId, user.id, boardId, boardTaskId)
          ..content = content;
    final created = await useCaseBoardTaskComment
        .createBoardTaskComment(newBoardTaskComment);

    assert(created != null);
    assert(created?.id == boardTaskCommentId);
    assert(created?.boardTaskId == boardTask.id);
    assert(created?.boardId == board.id);
    assert(created?.userId == user.id);
    assert(created?.content == content);

    List<BoardTaskComment> boardTaskComments = await useCaseBoardTaskComment
        .fetchBoardTaskComments(boardId, boardTaskId);
    assert(boardTaskComments.length == 1);
    assert(boardTaskComments[0].id == boardTaskCommentId);
  });

  test("fetchBoardTaskComment", () async {
    final boardTaskComment = await useCaseBoardTaskComment
        .fetchBoardTaskComment(boardId, boardTaskId, boardTaskCommentId);
    assert(boardTaskComment != null);
    assert(boardTaskComment?.id == boardTaskCommentId);
  });

  test("updateBoardTaskComment", () async {
    final boardTaskComment = await useCaseBoardTaskComment
        .fetchBoardTaskComment(boardId, boardTaskId, boardTaskCommentId);
    assert(boardTaskComment != null);

    const newBoardTaskCommentContent = "New Comment Content";
    boardTaskComment?.content = newBoardTaskCommentContent;

    final updatedBoardTaskComment =
        await useCaseBoardTaskComment.updateBoardTaskComment(boardTaskComment!);

    assert(updatedBoardTaskComment?.content == newBoardTaskCommentContent);
  });

  test("deleteBoardTaskComment", () async {
    final BoardTaskComment? boardTaskComment = await useCaseBoardTaskComment
        .fetchBoardTaskComment(boardId, boardTaskId, boardTaskCommentId);
    assert(boardTaskComment != null);

    bool deleted =
        await useCaseBoardTaskComment.deleteBoardTaskComment(boardTaskComment!);
    assert(deleted);
  });
}
