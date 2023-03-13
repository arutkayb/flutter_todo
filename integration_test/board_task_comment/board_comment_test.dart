import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/setup_helper.dart';
import '../helper/user_helper.dart';

void main() async {
  await setupTestDependencies();

  IUseCaseBoardTaskComment useCaseBoardTaskComment =
      locator.get<IUseCaseBoardTaskComment>();

  final boardTaskId = generateUid();
  final boardId = generateUid();
  const content = "Comment content";

  Future<BoardTaskComment?> createBoardTaskComment() async {
    return await useCaseBoardTaskComment.createBoardTaskComment(
        boardId, boardTaskId, content);
  }

  test("createBoardTaskComment", () async {
    final user = getCurrentUser();
    final created = await createBoardTaskComment();

    assert(created != null);
    assert(created?.boardTaskId == boardTaskId);
    assert(created?.boardId == boardId);
    assert(created?.userId == user.id);
    assert(created?.content == content);
  });

  test("fetchBoardTaskComments", () async {
    final created = await createBoardTaskComment();

    List<BoardTaskComment> boardTaskComments = await useCaseBoardTaskComment
        .fetchBoardTaskComments(boardId, boardTaskId);
    assert(boardTaskComments.length == 1);
    assert(boardTaskComments[0].id == created!.id);
  });

  test("fetchBoardTaskComment", () async {
    final created = await createBoardTaskComment();

    final boardTaskComment = await useCaseBoardTaskComment
        .fetchBoardTaskComment(boardId, boardTaskId, created!.id);
    assert(boardTaskComment != null);
    assert(boardTaskComment?.id == created.id);
  });

  test("updateBoardTaskComment", () async {
    final created = await createBoardTaskComment();

    final boardTaskComment = await useCaseBoardTaskComment
        .fetchBoardTaskComment(boardId, boardTaskId, created!.id);
    assert(boardTaskComment != null);

    const newBoardTaskCommentContent = "New Comment Content";
    boardTaskComment?.content = newBoardTaskCommentContent;

    final updatedBoardTaskComment =
        await useCaseBoardTaskComment.updateBoardTaskComment(boardTaskComment!);

    assert(updatedBoardTaskComment?.content == newBoardTaskCommentContent);
  });

  test("deleteBoardTaskComment", () async {
    final created = await createBoardTaskComment();

    final BoardTaskComment? boardTaskComment = await useCaseBoardTaskComment
        .fetchBoardTaskComment(boardId, boardTaskId, created!.id);
    assert(boardTaskComment != null);

    bool deleted =
        await useCaseBoardTaskComment.deleteBoardTaskComment(boardTaskComment!);
    assert(deleted);
  });
}
