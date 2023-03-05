import 'package:flutter_starter/common/models/board_list.dart';

abstract class BoardScreenEvent {}

class FetchFullBoard extends BoardScreenEvent {}

class CreateBoardList extends BoardScreenEvent {
  String boardListName;

  CreateBoardList(this.boardListName);
}

class DeleteBoardList extends BoardScreenEvent {
  BoardList boardList;

  DeleteBoardList(this.boardList);
}

class UpdateBoardList extends BoardScreenEvent {
  BoardList boardList;

  UpdateBoardList(this.boardList);
}