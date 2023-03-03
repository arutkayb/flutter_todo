import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/i_use_case_board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseBoardTaskAlarm extends UseCaseBase
    implements IUseCaseBoardTaskAlarm {
  @override
  Future<BoardTaskAlarm?> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    return remoteDataManager.createBoardTaskAlarm(boardTaskAlarm);
  }

  @override
  Future<bool> deleteBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    return remoteDataManager.deleteBoardTaskAlarm(boardTaskAlarm);
  }

  @override
  Future<BoardTaskAlarm?> fetchBoardTaskAlarm(
      String boardId, String boardTaskId, String id) {
    return remoteDataManager.fetchBoardTaskAlarm(boardId, boardTaskId, id);
  }

  @override
  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(
      String boardId, String boardTaskId) {
    return remoteDataManager.fetchBoardTaskAlarms(boardId, boardTaskId);
  }

  @override
  Future<BoardTaskAlarm?> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    return remoteDataManager.updateBoardTaskAlarm(boardTaskAlarm);
  }
}
