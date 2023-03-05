import 'package:flutter_starter/common/models/board.dart';

abstract class BoardEvent {}

class FetchBoardsTriggered extends BoardEvent {}

class BoardUpdated extends BoardEvent {}

class BoardCreated extends BoardEvent {
  String boardName;
  String? boardDescription;

  BoardCreated(this.boardName, this.boardDescription);
}

class BoardDeleted extends BoardEvent {
  final Board board;

  BoardDeleted(this.board);
}
