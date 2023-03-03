import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import '../integration_test/user/test_user.dart' as user_test;
import '../integration_test/board/test_board.dart' as board_test;
import '../integration_test/board_task/test_board_task.dart' as board_task_test;
import '../integration_test/board_task_alarm/test_board_alarm.dart'
    as board_alarm_test;
import '../integration_test/board_task_comment/test_board_comment.dart'
    as board_comment_test;
import '../integration_test/board_list/test_board_list.dart' as board_list_test;
import 'helper/user_helper.dart';

const integrationTesterUser = "integration_tester@test.com";
const integrationTestPassword = "123456";

void main() async {
  final testDirectory = 'test-${generateUid()}';

  await configureDependencies(
    isMock: false,
    resetDependencies: true,
    dataRootDirectory: testDirectory,
  );

  group('user tests', () {
    user_test.run();
  });

  // The rest of integration tests will use the tester account
  await integrationTesterSignIn();

  group('board tests', () {
    board_test.run();
    board_task_test.run();
    board_alarm_test.run();
    board_comment_test.run();
    board_list_test.run();

    tearDown(() {
      removeTestDirectory(testDirectory);
    });
  });
}

void removeTestDirectory(String directory) {
  print('Removing test directory: $directory');
  final remoteDataManager = locator.get<IRemoteDataManager>();
  remoteDataManager.removeDirectory(directory);
}
