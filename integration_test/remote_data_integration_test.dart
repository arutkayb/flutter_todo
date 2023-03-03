import 'package:flutter_starter/injection.dart';
import '../integration_test/user/test_user.dart' as user_test;
import '../integration_test/board/test_board.dart' as board_test;
import '../integration_test/board_task/test_board_task.dart' as board_task_test;
import '../integration_test/board_task_alarm/test_board_alarm.dart'
    as board_alarm_test;
import '../integration_test/board_task_comment/test_board_comment.dart'
    as board_comment_test;
import '../integration_test/board_list/test_board_list.dart' as board_list_test;

const integrationTesterUser = "integration_tester@test.com";
const integrationTestPassword = "123456";

void main() async {
  await configureDependencies(
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
