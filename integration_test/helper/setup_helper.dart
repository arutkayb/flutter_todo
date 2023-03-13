import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import 'user_helper.dart';

Future<void> setupTestDependencies([bool loginIntegrationTester = true]) async {
  String testDirectory = 'test-${generateUid()}';

  await configureDependencies(
    resetDependencies: true,
    dataRootDirectory: testDirectory,
  );

  if (loginIntegrationTester) {
    await integrationTesterSignIn();
  }

  tearDown(() {
    removeTestDirectory(testDirectory);
  });
}

void removeTestDirectory(String directory) {
  print('Removing test directory: $directory');
  final remoteDataManager = locator.get<IRemoteDataManager>();
  remoteDataManager.removeDirectory(directory);
}
