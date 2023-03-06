import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/setup_helper.dart';
import '../helper/user_helper.dart';

void main() async {
  await setupTestDependencies(false);

  IUseCaseUser useCaseUser = locator.get<IUseCaseUser>();

  group('Test user creation', () {
    final testUserEmail = '${generateUid()}@test.com';

    test("User created, signed in, deleted", () async {
      final created =
          await useCaseUser.createUserWithEmail(testUserEmail, '123456');

      final users = await useCaseUser.getUsers();
      users.firstWhere((user) => user.id == created.id);

      final signedIn =
          await useCaseUser.signInWithEmail(testUserEmail, '123456');
      assert(signedIn);

      final deleted = await useCaseUser.deleteCurrentUser();
      assert(deleted);
    });

    tearDown(() async {
      // try to delete and ignore the result
      // in case of a failed and terminated test flows
      await useCaseUser.deleteCurrentUser();
    });
  });

  group('Integration tester operations', () {
    test("User signed in", () async {
      final signedIn = await integrationTesterSignIn();
      assert(signedIn != null);
    });

    test("User get", () async {
      final user = useCaseUser.getCurrentUser();
      assert(user?.email == integrationTesterUser);
    });

    test("User logout", () async {
      await useCaseUser.logout();
      final currentUser = useCaseUser.getCurrentUser();

      assert(currentUser == null);
      assert(useCaseUser.isUserLoggedIn() == false);
    });
  });
}
