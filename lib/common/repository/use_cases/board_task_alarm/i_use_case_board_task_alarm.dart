import 'package:flutter_starter/common/models/board_task_alarm.dart';

abstract class IUseCaseBoardTaskAlarm {
  Future<BoardTaskAlarm?> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm);

  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(
      String boardId, String boardTaskId);

  Future<BoardTaskAlarm?> fetchBoardTaskAlarm(
      String boardId, String boardTaskId, String id);

  Future<BoardTaskAlarm?> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm);

  Future<bool> deleteBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm);
}
