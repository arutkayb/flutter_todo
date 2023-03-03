import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/i_use_case_board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class MockUseCaseBoardTaskAlarm extends UseCaseBase
    implements IUseCaseBoardTaskAlarm {
  @override
  Future<BoardTaskAlarm?> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    // TODO: implement createBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    // TODO: implement deleteBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> fetchBoardTaskAlarm(String boardId, String boardTaskId, String id) {
    // TODO: implement fetchBoardTaskAlarm
    throw UnimplementedError();
  }

  @override
  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(String boardId, String boardTaskId) {
    // TODO: implement fetchBoardTaskAlarms
    throw UnimplementedError();
  }

  @override
  Future<BoardTaskAlarm?> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm) {
    // TODO: implement updateBoardTaskAlarm
    throw UnimplementedError();
  }

}
