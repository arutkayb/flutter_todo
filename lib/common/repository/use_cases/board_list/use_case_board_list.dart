import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/repository/use_cases/board_list/i_use_case_board_list.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseBoardList extends UseCaseBase implements IUseCaseBoardList {
  @override
  Future<BoardList?> createBoardList(BoardList boardList) {
    return remoteDataManager.createBoardList(boardList);
  }

  @override
  Future<bool> deleteBoardList(BoardList boardList) {
    return remoteDataManager.deleteBoardList(boardList.boardId, boardList.id);
  }

  @override
  Future<BoardList?> fetchBoardList(String boardId, String id) {
    return remoteDataManager.fetchBoardList(boardId, id);
  }

  @override
  Future<List<BoardList>> fetchBoardLists(Board board) {
    return remoteDataManager.fetchBoardLists(board.id);
  }

  @override
  Future<BoardList?> updateBoardList(BoardList boardList) {
    return remoteDataManager.updateBoardList(boardList);
  }
}
