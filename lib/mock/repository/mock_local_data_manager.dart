import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/common/repository/local/dao/i_dao.dart';
import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';

class MockLocalDataManager implements ILocalDataManager {
  @override
  IDao getUserDao() {
    // TODO: implement getUserDao
    throw UnimplementedError();
  }

  @override
  AppTheme getAppTheme() {
    // TODO: implement getAppTheme
    throw UnimplementedError();
  }

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAppTheme(AppTheme appTheme) {
    // TODO: implement saveAppTheme
    throw UnimplementedError();
  }
}
