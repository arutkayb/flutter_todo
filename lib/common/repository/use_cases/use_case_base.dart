import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';
import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';
import 'package:flutter_starter/locator.dart';

abstract class UseCaseBase {
  final ILocalDataManager _localDataManager = locator.get<ILocalDataManager>();
  final IRemoteDataManager _remoteDataManager =
      locator.get<IRemoteDataManager>();

  UseCaseBase();

  IRemoteDataManager get remoteDataManager => _remoteDataManager;

  ILocalDataManager get localDataManager => _localDataManager;
}
