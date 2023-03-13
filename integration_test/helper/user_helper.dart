import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/common/repository/use_cases/user/i_use_case_user.dart';
import 'package:flutter_starter/locator.dart';

IUseCaseUser useCaseUser = locator.get<IUseCaseUser>();
const integrationTesterUser = "integration_tester@test.com";
const integrationTestPassword = "123456";

Future<User?> integrationTesterSignIn() async {
  try {
    await useCaseUser.signInWithEmail(
        integrationTesterUser, integrationTestPassword);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email. Creating the test user.');
      await useCaseUser.createUserWithEmail(integrationTesterUser,
          integrationTestPassword); //  creates the integration tester if it is not created
    }
  } catch (err) {
    print('Caught error: $err');
  }

  return useCaseUser.getCurrentUser();
}

User getCurrentUser() {
  final user = useCaseUser.getCurrentUser();

  assert(user != null);

  return user!;
}
