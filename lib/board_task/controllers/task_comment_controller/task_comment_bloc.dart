import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board_task/controllers/task_comment_controller/task_comment_event.dart';
import 'package:flutter_starter/board_task/controllers/task_comment_controller/task_comment_state.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/injection.dart';

class TaskCommentBloc extends Bloc<TaskCommentEvent, TaskCommentState> {
  final IUseCaseBoardTaskComment _useCaseBoardTaskComment =
      locator.get<IUseCaseBoardTaskComment>();

  TaskCommentBloc(super.initialState) {
    on<FetchTaskComments>((event, emit) async {
      emit(TaskCommentState.fetching(state, true));
      final comments =
          await _fetchTaskComments(event.boardId, event.boardTaskId);
      emit(TaskCommentState(comments));
    });

    on<CreateNewComment>((event, emit) async {
      emit(TaskCommentState.fetching(state, true));
      await _createNewComment(event.boardId, event.boardTaskId, event.content);
      final comments =
          await _fetchTaskComments(event.boardId, event.boardTaskId);
      emit(TaskCommentState(comments));
    });

    on<DeleteTaskComment>((event, emit) async {
      emit(TaskCommentState.fetching(state, true));
      await _deleteTaskComment(event.taskComment);
      final comments =
          await _fetchTaskComments(event.boardId, event.boardTaskId);
      emit(TaskCommentState(comments));
    });
  }

  Future<List<BoardTaskComment>> _fetchTaskComments(
      String boardId, String boardTaskId) {
    return _useCaseBoardTaskComment.fetchBoardTaskComments(
        boardId, boardTaskId);
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
