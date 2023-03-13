import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';
import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';
import 'package:flutter_starter/common/repository/use_cases/analytics/i_use_case_analytics.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/i_use_case_board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/settings/i_use_case_settings.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/mock/repository/mock_local_data_manager.dart';
import 'package:flutter_starter/mock/repository/mock_remote_data_manager.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_analytics.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_list.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_task.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_task_alarm.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_task_comment.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_settings.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_user.dart';

Future<void> _resetDependencies() async {
  await locator.reset();
}

Future configureMock({resetDependencies = false}) async {
  if (resetDependencies) {
    await _resetDependencies();
  }

  locator.registerSingleton<ILocalDataManager>(MockLocalDataManager());
  locator.registerSingleton<IRemoteDataManager>(MockRemoteDataManager());

  locator.registerSingleton<IUseCaseAnalytics>(
    MockUseCaseAnalytics(),
  );

  locator.registerSingleton<IUseCaseSettings>(
    MockUseCaseSettings(),
  );

  locator.registerSingleton<IUseCaseUser>(
    MockUseCaseUser(),
  );

  locator.registerSingleton<IUseCaseBoard>(
    MockUseCaseBoard(),
  );

  locator.registerSingleton<IUseCaseBoardList>(
    MockUseCaseBoardList(),
  );

  locator.registerSingleton<IUseCaseBoardTask>(
    MockUseCaseBoardTask(),
  );

  locator.registerSingleton<IUseCaseBoardTaskComment>(
    MockUseCaseBoardTaskComment(),
  );

  locator.registerSingleton<IUseCaseBoardTaskAlarm>(
    MockUseCaseBoardTaskAlarm(),
  );
}
