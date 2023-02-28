import 'package:flutter_starter/injection.dart';

import 'user/test_user.dart' as user_test;

void main() {
  configureDependencies(isMock: true, resetDependencies: true);

  user_test.main();
}
