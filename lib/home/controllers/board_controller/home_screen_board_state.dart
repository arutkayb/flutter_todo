import 'package:flutter_starter/common/models/board.dart';

class HomeScreenBoardState {
  List<Board> boards = List.empty();

  HomeScreenBoardState();

  HomeScreenBoardState.withBoards(this.boards);
}
