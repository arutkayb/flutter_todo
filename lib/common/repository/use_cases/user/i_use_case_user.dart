abstract class IUseCaseUser {
  bool isUserLoggedIn();

  Future<void> logout();
}
