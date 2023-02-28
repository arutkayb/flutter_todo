import 'package:flutter_starter/common/repository/local/dao/i_dao.dart';
import 'package:flutter_starter/common/repository/local/i_local_data_manager.dart';

class MockLocalDataManager implements ILocalDataManager {
  @override
  IDao getUserDao() {
    // TODO: implement getUserDao
    throw UnimplementedError();
  }
}
