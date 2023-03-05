import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_event.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_state.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/task_label.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/injection.dart';

class BoardTaskScreenBloc extends Bloc<dynamic, BoardTaskScreenState> {
  final IUseCaseBoardTask _useCaseBoardTask = locator.get<IUseCaseBoardTask>();

  BoardTaskScreenBloc(super.initialState) {
    on<SaveBoardTask>((event, emit) async {
      emit(BoardTaskScreenState.fetching(state, true));

      String boardListId = event.boardListId ?? state.boardTask.boardListId;
      String? title = event.title;
      String? description = event.description;
      TaskLabel? label = event.label;
      DateTime? dateStart = event.dateStart;
      DateTime? dateEnd = event.dateEnd;

      final BoardTask boardTask = BoardTask(
        state.boardTask.id,
        state.boardTask.boardId,
        boardListId,
      )
        ..title = title
        ..description = description
        ..label = label
        ..dateStart = dateStart
        ..dateEnd = dateEnd;

      var boardTaskCreated = await _saveBoardTask(boardTask);

      if (boardTaskCreated == null) {
        //TODO: handle error
      } else {
        emit(BoardTaskScreenState(boardTaskCreated, state.boardLists));
      }
    });
  }

  Future<BoardTask?> _saveBoardTask(BoardTask boardTask) {
    return _useCaseBoardTask.updateBoardTask(boardTask);
  }
}
