import 'package:flutter_starter/common/models/user.dart';

class LoginScreenState {
  final User? user;

  final bool? fetching;

  const LoginScreenState([this.user, fetching]) : fetching = fetching ?? false;

  LoginScreenState.fetching(LoginScreenState state, this.fetching)
      : user = state.user;
}
