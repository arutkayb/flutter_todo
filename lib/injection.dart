import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';
import 'package:flutter_starter/common/repository/local/local_data_manager.dart';
import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';
import 'package:flutter_starter/common/repository/remote/remote_data_manager.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/use_case_board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/i_use_case_board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task/use_case_board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/i_use_case_board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_alarm/use_case_board_task_alarm.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/i_use_case_board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/board_task_comment/use_case_board_task_comment.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/common/repository/use_cases/user/use_case_user.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/mock/repository/mock_local_data_manager.dart';
import 'package:flutter_starter/mock/repository/mock_remote_data_manager.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_list.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_task.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_task_alarm.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_board_task_comment.dart';
import 'package:flutter_starter/mock/repository/mock_use_case_user.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future _configureMock() async {
  locator.registerSingleton<ILocalDataManager>(MockLocalDataManager());
  locator.registerSingleton<IRemoteDataManager>(MockRemoteDataManager());

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

Future _configureReal() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseDatabase.instance.setPersistenceEnabled(true);

  locator.registerSingleton<ILocalDataManager>(LocalDataManager());
  locator.registerSingleton<IRemoteDataManager>(RemoteDataManager());

  locator.registerSingleton<IUseCaseUser>(
    UseCaseUser(),
  );

  locator.registerSingleton<IUseCaseBoard>(
    UseCaseBoard(),
  );

  locator.registerSingleton<IUseCaseBoardList>(
    UseCaseBoardList(),
  );

  locator.registerSingleton<IUseCaseBoardTask>(
    UseCaseBoardTask(),
  );

  locator.registerSingleton<IUseCaseBoardTaskComment>(
    UseCaseBoardTaskComment(),
  );

  locator.registerSingleton<IUseCaseBoardTaskAlarm>(
    UseCaseBoardTaskAlarm(),
  );
}

Future configureDependencies({
  bool isMock = false,
  bool resetDependencies = false,
}) async {
  if (resetDependencies) {
    locator.reset();
  }

  if (isMock) {
    await _configureMock();
  } else {
    await _configureReal();
  }
}
