abstract class BoardScreenEvent {}

class FetchBoardLists extends BoardScreenEvent {}

class CreateBoardList extends BoardScreenEvent {
  String boardListName;

  CreateBoardList(this.boardListName);
}
