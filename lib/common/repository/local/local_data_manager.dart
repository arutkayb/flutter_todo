import 'package:flutter_starter/common/repository/local/dao/i_dao.dart';
import 'package:flutter_starter/common/repository/local/dao/user/dao_user.dart';
import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';

class LocalDataManager implements ILocalDataManager {
  final DaoUser _daoUser = DaoUser();

  @override
  IDao getUserDao() {
    return _daoUser;
  }
}
