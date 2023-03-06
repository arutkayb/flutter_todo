import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board_task/controllers/task_comment_controller/task_comment_event.dart';
import 'package:flutter_starter/board_task/controllers/task_comment_controller/task_comment_state.dart';
import 'package:flutter_starter/board_task/models/extended_board_task_comment.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/injection.dart';

class TaskCommentBloc extends Bloc<TaskCommentEvent, TaskCommentState> {
  final IUseCaseBoardTaskComment _useCaseBoardTaskComment =
      locator.get<IUseCaseBoardTaskComment>();
  final IUseCaseUser _useCaseUser = locator.get<IUseCaseUser>();

  TaskCommentBloc(super.initialState) {
    on<FetchTaskComments>((event, emit) async {
      emit(TaskCommentState.fetching(state, true));
      final comments =
          await _fetchExtendedTaskComments(event.boardId, event.boardTaskId);
      emit(TaskCommentState(comments));
    });

    on<CreateNewComment>((event, emit) async {
      emit(TaskCommentState.fetching(state, true));
      await _createNewComment(event.boardId, event.boardTaskId, event.content);
      final comments =
          await _fetchExtendedTaskComments(event.boardId, event.boardTaskId);
      emit(TaskCommentState(comments));
    });

    on<DeleteTaskComment>((event, emit) async {
      emit(TaskCommentState.fetching(state, true));
      await _deleteTaskComment(event.taskComment);
      final comments =
          await _fetchExtendedTaskComments(event.boardId, event.boardTaskId);
      emit(TaskCommentState(comments));
    });
  }

  Future<List<ExtendedBoardTaskComment>> _fetchExtendedTaskComments(
      String boardId, String boardTaskId) async {
    List<ExtendedBoardTaskComment> extendedComments =
        List.empty(growable: true);

    final boardTaskComments = await _useCaseBoardTaskComment
        .fetchBoardTaskComments(boardId, boardTaskId);

    final users = await _useCaseUser.getUsers();

    for (var boardTaskComment in boardTaskComments) {
      User? commentUser;
      try {
        commentUser =
            users.firstWhere((user) => user.id == boardTaskComment.userId);
      } catch (e) {
        // TODO: handle un-found users
      }

      extendedComments
          .add(ExtendedBoardTaskComment(boardTaskComment, commentUser));
    }

    return extendedComments;
  }

  Future<BoardTaskComment?> _createNewComment(
      String boardId, String boardTaskId, String content) {
    return _useCaseBoardTaskComment.createBoardTaskComment(
        boardId, boardTaskId, content);
  }

  Future<bool> _deleteTaskComment(BoardTaskComment taskComment) {
    return _useCaseBoardTaskComment.deleteBoardTaskComment(taskComment);
  }
}
