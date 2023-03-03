import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/board_task_alarm.dart';

abstract class IUseCaseBoardTaskAlarm {
  Future<BoardTaskAlarm?> createBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm);

  Future<List<BoardTaskAlarm>> fetchBoardTaskAlarms(BoardTask boardTask);

  Future<BoardTaskAlarm?> fetchBoardTaskAlarm(String id);

  Future<BoardTaskAlarm?> updateBoardTaskAlarm(BoardTaskAlarm boardTaskAlarm);

  Future<bool> deleteBoardTaskAlarm(String id);
}
