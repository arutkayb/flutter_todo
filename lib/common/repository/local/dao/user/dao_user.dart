import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/local/dao/i_dao.dart';

class DaoUser with IDao<User> {
  @override
  Future<User?> create(User entity) async {
    // TODO: implement create
    return null;
  }

  @override
  Future<bool> delete(User entity) async {
    // TODO: implement delete
    return false;
  }

  @override
  Future<User?> read() async {
    // TODO: implement read
    return null;
  }

  @override
  Future<User?> update(User entity) async {
    // TODO: implement update
    return null;
  }
}
