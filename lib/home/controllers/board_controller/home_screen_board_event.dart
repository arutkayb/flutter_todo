abstract class BoardEvent{}

class FetchBoardsTriggered extends BoardEvent{}

class BoardUpdated extends BoardEvent {}

class BoardCreated extends BoardEvent {
  String boardName;
  String? boardDescription;

  BoardCreated(this.boardName, this.boardDescription);
}
