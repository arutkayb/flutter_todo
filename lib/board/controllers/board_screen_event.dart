abstract class BoardScreenEvent {}

class FetchFullBoard extends BoardScreenEvent {}

class CreateBoardList extends BoardScreenEvent {
  String boardListName;

  CreateBoardList(this.boardListName);
}
