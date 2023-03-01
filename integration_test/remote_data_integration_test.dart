import 'package:flutter_starter/injection.dart';
import 'user/test_user.dart' as user_test;
import 'board/test_board.dart' as board_test;
import 'board_task/test_board_task.dart' as board_task_test;
import 'board_task_alarm/test_board_alarm.dart' as board_alarm_test;
import 'board_task_comment/test_board_comment.dart' as board_comment_test;
import 'board_list/test_board_list.dart' as board_list_test;

void main() {
  configureDependencies(
    isMock: false,
    resetDependencies: true,
    dataRootDirectory: 'test',
  );

  user_test.main();
  board_test.main();
  board_task_test.main();
  board_alarm_test.main();
  board_comment_test.main();
  board_list_test.main();
}
