import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';
import 'package:flutter_starter/common/repository/local/local_data_manager.dart';
import 'package:flutter_starter/common/repository/mock/mock_local_data_manager.dart';
import 'package:flutter_starter/common/repository/mock/mock_remote_data_manager.dart';
import 'package:flutter_starter/common/repository/mock/mock_use_case_user.dart';
import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';
import 'package:flutter_starter/common/repository/remote/remote_data_manager.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/common/repository/use_cases/user/use_case_user.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future _configureMock() async {
  locator.registerSingleton<ILocalDataManager>(MockLocalDataManager());
  locator.registerSingleton<IRemoteDataManager>(MockRemoteDataManager());

  locator.registerSingleton<IUseCaseUser>(
    MockUseCaseUser(),
  );
}

Future _configureReal() async {
  locator.registerSingleton<ILocalDataManager>(LocalDataManager());
  locator.registerSingleton<IRemoteDataManager>(RemoteDataManager());

  locator.registerSingleton<IUseCaseUser>(
    UseCaseUser(),
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
