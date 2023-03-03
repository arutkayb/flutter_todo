import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/i_use_case_board_task_alarm.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';

void run() {
  IUseCaseBoardTaskAlarm useCaseBoardTaskAlarm =
      locator.get<IUseCaseBoardTaskAlarm>();

  final uid = generateUid();
  final boardTaskAlarmDueDate = DateTime.now();

  test("createBoardTaskAlarm and fetchBoardTaskAlarms", () async {
    final board = await createBoard();
    final boardList = await createBoardList(board);
    final boardTask = await createBoardTask(boardList);

    BoardTaskAlarm newBoardTaskAlarm =
        BoardTaskAlarm(uid, board.id, boardTask.id)
          ..dueDate = boardTaskAlarmDueDate;
    final created =
        await useCaseBoardTaskAlarm.createBoardTaskAlarm(newBoardTaskAlarm);

    assert(created != null);
    assert(created?.id == uid);
    assert(created?.boardTaskId == boardTask.id);
    assert(created?.dueDate == boardTaskAlarmDueDate);

    List<BoardTaskAlarm> boardTaskAlarms =
        await useCaseBoardTaskAlarm.fetchBoardTaskAlarms(boardTask);
    assert(boardTaskAlarms.length == 1);
    assert(boardTaskAlarms[0].id == uid);
  });

  test("fetchBoardTaskAlarm", () async {
    final boardTaskAlarm = await useCaseBoardTaskAlarm.fetchBoardTaskAlarm(uid);
    assert(boardTaskAlarm != null);
    assert(boardTaskAlarm?.id == uid);
  });

  test("updateBoardTaskAlarm", () async {
    final boardTaskAlarm = await useCaseBoardTaskAlarm.fetchBoardTaskAlarm(uid);
    assert(boardTaskAlarm != null);

    final newBoardTaskAlarmDueDate = DateTime.now();
    boardTaskAlarm?.dueDate = newBoardTaskAlarmDueDate;

    final updatedBoardTaskAlarm =
        await useCaseBoardTaskAlarm.updateBoardTaskAlarm(boardTaskAlarm!);

    assert(updatedBoardTaskAlarm?.dueDate == newBoardTaskAlarmDueDate);
  });

  test("deleteBoardTaskAlarm", () async {
    final boardTaskAlarm = await useCaseBoardTaskAlarm.fetchBoardTaskAlarm(uid);
    assert(boardTaskAlarm != null);

    bool deleted =
        await useCaseBoardTaskAlarm.deleteBoardTaskAlarm(boardTaskAlarm!.id);
    assert(deleted);
  });
}
