import 'package:flutter_starter/common/models/board.dart';

class HomeScreenBoardState {
  bool fetching;
  List<Board> boards = List.empty();

  HomeScreenBoardState() : fetching = false;

  HomeScreenBoardState.withBoards(this.boards) : fetching = false;

  HomeScreenBoardState.fetching(HomeScreenBoardState state, this.fetching)
      : boards = state.boards;
}
