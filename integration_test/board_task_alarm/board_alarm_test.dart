import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/i_use_case_board_task_alarm.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';
import '../helper/setup_helper.dart';

void main() async {
  await setupTestDependencies();

  IUseCaseBoardTaskAlarm useCaseBoardTaskAlarm =
      locator.get<IUseCaseBoardTaskAlarm>();

  final boardTaskAlarmId = generateUid();
  final boardTaskId = generateUid();
  final boardTaskAlarmDueDate = DateTime.now();
  final board = await createBoard();

  Future<BoardTaskAlarm?> createBoardTaskAlarm() async {
    final boardList = await createBoardList(board);
    final boardTask = await createBoardTask(boardList, boardTaskId);

    BoardTaskAlarm newBoardTaskAlarm =
        BoardTaskAlarm(boardTaskAlarmId, board.id, boardTask.id!)
          ..dueDate = boardTaskAlarmDueDate;
    return await useCaseBoardTaskAlarm.createBoardTaskAlarm(newBoardTaskAlarm);
  }

  test("createBoardTaskAlarm", () async {
    final created = await createBoardTaskAlarm();

    assert(created != null);
    assert(created?.id == boardTaskAlarmId);
    assert(created?.boardId == board.id);
    assert(created?.boardTaskId == boardTaskId);
    assert(created?.dueDate == boardTaskAlarmDueDate);
  });

  test("fetchBoardTaskAlarms", () async {
    await createBoardTaskAlarm();

    final board = await createBoard();
    final boardList = await createBoardList(board);
    final boardTask = await createBoardTask(boardList, boardTaskId);

    BoardTaskAlarm newBoardTaskAlarm =
        BoardTaskAlarm(boardTaskAlarmId, board.id, boardTask.id!)
          ..dueDate = boardTaskAlarmDueDate;
    final created =
        await useCaseBoardTaskAlarm.createBoardTaskAlarm(newBoardTaskAlarm);

    assert(created != null);
    assert(created?.id == boardTaskAlarmId);
    assert(created?.boardId == board.id);
    assert(created?.boardTaskId == boardTask.id);
    assert(created?.dueDate == boardTaskAlarmDueDate);

    List<BoardTaskAlarm> boardTaskAlarms =
        await useCaseBoardTaskAlarm.fetchBoardTaskAlarms(board.id, boardTaskId);
    assert(boardTaskAlarms.length == 1);
    assert(boardTaskAlarms[0].id == boardTaskAlarmId);
  });

  test("fetchBoardTaskAlarm", () async {
    await createBoardTaskAlarm();

    final boardTaskAlarm = await useCaseBoardTaskAlarm.fetchBoardTaskAlarm(
        board.id, boardTaskId, boardTaskAlarmId);
    assert(boardTaskAlarm != null);
    assert(boardTaskAlarm?.id == boardTaskAlarmId);
  });

  test("updateBoardTaskAlarm", () async {
    await createBoardTaskAlarm();

    final boardTaskAlarm = await useCaseBoardTaskAlarm.fetchBoardTaskAlarm(
        board.id, boardTaskId, boardTaskAlarmId);
    assert(boardTaskAlarm != null);

    final newBoardTaskAlarmDueDate = DateTime.now();
    boardTaskAlarm?.dueDate = newBoardTaskAlarmDueDate;

    final updatedBoardTaskAlarm =
        await useCaseBoardTaskAlarm.updateBoardTaskAlarm(boardTaskAlarm!);

    assert(updatedBoardTaskAlarm?.dueDate == newBoardTaskAlarmDueDate);
  });

  test("deleteBoardTaskAlarm", () async {
    await createBoardTaskAlarm();

    final BoardTaskAlarm? boardTaskAlarm = await useCaseBoardTaskAlarm
        .fetchBoardTaskAlarm(board.id, boardTaskId, boardTaskAlarmId);
    assert(boardTaskAlarm != null);

    bool deleted =
        await useCaseBoardTaskAlarm.deleteBoardTaskAlarm(boardTaskAlarm!);
    assert(deleted);
  });
}
