import 'package:flutter_starter/common/repository/local/dao/i_dao.dart';

abstract class ILocalDataManager {
  IDao getUserDao();
}
