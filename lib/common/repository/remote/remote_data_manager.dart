import 'package:dio/dio.dart';
import 'package:flutter_starter/common/repository/remote/i_remote_data_manager.dart';

class RemoteDataManager implements IRemoteDataManager {
  final dio = Dio();
}
