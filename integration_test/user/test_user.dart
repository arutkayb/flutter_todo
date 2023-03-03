import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../remote_data_integration_test.dart';

void run() {
  IUseCaseUser useCaseUser = locator.get<IUseCaseUser>();

  group('Test user creation', () {
    final testUserEmail = '${generateUid()}@test.com';

    test("User created, signed in, deleted", () async {
      final created =
          await useCaseUser.createUserWithEmail(testUserEmail, '123456');
      assert(created);

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
      try {
        await useCaseUser.createUserWithEmail(integrationTesterUser,
            integrationTestPassword); //  creates the integration tester if it is not created, ignore the result
      } catch (e) {
        print(e.toString());
        // ignore
      }

      final signedIn = await useCaseUser.signInWithEmail(
          integrationTesterUser, integrationTestPassword);
      assert(signedIn);
    });

    test("User get", () async {
      final user = await useCaseUser.getCurrentUser();
      assert(user?.email == integrationTesterUser);
    });

    test("User logout", () async {
      await useCaseUser.logout();
      final currentUser = await useCaseUser.getCurrentUser();

      assert(currentUser == null);
      assert(await useCaseUser.isUserLoggedIn() == false);
    });
  });
}
