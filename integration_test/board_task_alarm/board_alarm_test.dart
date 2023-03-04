import 'package:flutter_starter/common/models/board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/i_use_case_board_task_alarm.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/board_helper.dart';
import '../helper/setup_helper.dart';
import '../helper/user_helper.dart';

void main() async {
  await setupTestDependencies();

  IUseCaseBoardTaskAlarm useCaseBoardTaskAlarm =
      locator.get<IUseCaseBoardTaskAlarm>();

  final boardTaskAlarmId = generateUid();
  final boardTaskId = generateUid();
  final boardId = generateUid();
  final boardTaskAlarmDueDate = DateTime.now();

  Future<BoardTaskAlarm?> createBoardTaskAlarm() async {
    final board = await createBoard(boardId);
    final boardList = await createBoardList(board);
    final boardTask = await createBoardTask(boardList, boardTaskId);

    BoardTaskAlarm newBoardTaskAlarm =
        BoardTaskAlarm(boardTaskAlarmId, board.id, boardTask.id)
          ..dueDate = boardTaskAlarmDueDate;
    return await useCaseBoardTaskAlarm.createBoardTaskAlarm(newBoardTaskAlarm);
  }

  test("createBoardTaskAlarm", () async {
    final created = await createBoardTaskAlarm();

    assert(created != null);
    assert(created?.id == boardTaskAlarmId);
    assert(created?.boardId == boardId);
    assert(created?.boardTaskId == boardTaskId);
    assert(created?.dueDate == boardTaskAlarmDueDate);
  });

  test("fetchBoardTaskAlarms", () async {
    await createBoardTaskAlarm();

    final board = await createBoard(boardId);
    final boardList = await createBoardList(board);
    final boardTask = await createBoardTask(boardList, boardTaskId);

    BoardTaskAlarm newBoardTaskAlarm =
        BoardTaskAlarm(boardTaskAlarmId, board.id, boardTask.id)
          ..dueDate = boardTaskAlarmDueDate;
    final created =
        await useCaseBoardTaskAlarm.createBoardTaskAlarm(newBoardTaskAlarm);

    assert(created != null);
    assert(created?.id == boardTaskAlarmId);
    assert(created?.boardId == board.id);
    assert(created?.boardTaskId == boardTask.id);
    assert(created?.dueDate == boardTaskAlarmDueDate);

    List<BoardTaskAlarm> boardTaskAlarms =
        await useCaseBoardTaskAlarm.fetchBoardTaskAlarms(boardId, boardTaskId);
    assert(boardTaskAlarms.length == 1);
    assert(boardTaskAlarms[0].id == boardTaskAlarmId);
  });

  test("fetchBoardTaskAlarm", () async {
    await createBoardTaskAlarm();

    final boardTaskAlarm = await useCaseBoardTaskAlarm.fetchBoardTaskAlarm(
        boardId, boardTaskId, boardTaskAlarmId);
    assert(boardTaskAlarm != null);
    assert(boardTaskAlarm?.id == boardTaskAlarmId);
  });

  test("updateBoardTaskAlarm", () async {
    await createBoardTaskAlarm();

    final boardTaskAlarm = await useCaseBoardTaskAlarm.fetchBoardTaskAlarm(
        boardId, boardTaskId, boardTaskAlarmId);
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
        .fetchBoardTaskAlarm(boardId, boardTaskId, boardTaskAlarmId);
    assert(boardTaskAlarm != null);

    bool deleted =
        await useCaseBoardTaskAlarm.deleteBoardTaskAlarm(boardTaskAlarm!);
    assert(deleted);
  });
}
