import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/statistics/controllers/statistics_screen_state.dart';

class StatisticsScreenCubit extends Cubit<StatisticsScreenState> {
  StatisticsScreenCubit(super.initialState);

  int getNumberOfFinishedTasks() {
    int finished = 0;
    for (var task in state.fullBoard.boardTasks!) {
      if (task.dateEnd != null) {
        finished++;
      }
    }
    return finished;
  }

  int getNumberOfStartedNotFinishedTasks() {
    int startedNotFinished = 0;
    for (var task in state.fullBoard.boardTasks!) {
      if (task.dateStart != null && task.dateEnd == null) {
        startedNotFinished++;
      }
    }

    return startedNotFinished;
  }

  int getNumberOfNotStartedTasks() {
    int notStarted = 0;
    for (var task in state.fullBoard.boardTasks!) {
      if (task.dateStart == null) {
        notStarted++;
      }
    }

    return notStarted;
  }

  Duration? getAverageTaskFinishTime() {
    List<BoardTask>? tasks;

    try {
      tasks = state.fullBoard.boardTasks!
          .where((task) => task.dateStart != null && task.dateEnd != null)
          .toList();
    } catch (e) {
      //ignore
    }

    if (tasks != null && tasks.isNotEmpty) {
      Duration totalDuration = Duration.zero;

      for (var task in tasks) {
        totalDuration =
            totalDuration + (task.dateEnd!.difference(task.dateStart!));
      }

      return Duration(
          microseconds: totalDuration.inMicroseconds ~/ tasks.length);
    }

    return null;
  }
}
