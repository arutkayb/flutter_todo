import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/common/repository/local/dao/i_dao.dart';

abstract class ILocalDataManager {
  IDao getUserDao();

  Future<void> initialize();

  Future<bool> saveAppTheme(AppTheme appTheme);

  AppTheme getAppTheme();
}
