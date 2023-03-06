import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/common/repository/local/dao/i_dao.dart';
import 'package:flutter_starter/common/repository/local/dao/user/dao_user.dart';
import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataManager implements ILocalDataManager {
  final DaoUser _daoUser = DaoUser();
  late final SharedPreferences _sharedPrefs;

  @override
  Future<void> initialize() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  IDao getUserDao() {
    return _daoUser;
  }

  @override
  Future<bool> saveAppTheme(AppTheme appTheme) async {
    return await _sharedPrefs.setString('theme', appTheme.value);
  }

  @override
  AppTheme getAppTheme() {
    return AppTheme.fromValue(_sharedPrefs.getString('theme') ?? "primary");
  }
}
