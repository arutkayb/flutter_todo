import 'package:flutter_starter/common/models/user.dart';

class HomeScreenState {
  final bool? isReady;
  final User? user;

  const HomeScreenState([this.user, this.isReady]);

  HomeScreenState.fetching(HomeScreenState state)
      : isReady = false,
        user = state.user;
}
