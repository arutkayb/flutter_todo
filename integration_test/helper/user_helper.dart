import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/injection.dart';

import '../remote_data_integration_test.dart';

IUseCaseUser useCaseUser = locator.get<IUseCaseUser>();

Future<User> integrationTesterSignIn() async {
  final signedIn = await useCaseUser.signInWithEmail(
      integrationTesterUser, integrationTestPassword);

  assert(signedIn);

  final user = useCaseUser.getCurrentUser();
  assert(user != null);

  return user!;
}

User getCurrentUser() {
  final user = useCaseUser.getCurrentUser();

  assert(user != null);

  return user!;
}
