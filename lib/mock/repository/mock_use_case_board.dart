import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/full_board.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';
import 'package:flutter_starter/utils/string_utils.dart';

class MockUseCaseBoard extends UseCaseBase implements IUseCaseBoard {
  List<Board> _boards = List.empty(growable: true);
  String userId = generateUid();

  @override
  Future<Board> createBoard(String boardName, String? boardDescription) async {
    final board = Board(generateUid(), userId, boardName, boardDescription);
    _boards.add(board);
    return board;
  }

  @override
  Future<bool> deleteBoard(String id) async {
    try {
      final board = _boards.firstWhere((element) => element.id == id);
      _boards.remove(board);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Board?> fetchBoard(String id) async {
    try {
      final board = _boards.firstWhere((element) => element.id == id);
      return board;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Board>> fetchBoards() async {
    return _boards;
  }

  @override
  Future<Board?> updateBoard(Board board) async {
    try {
      final boardIndex =
          _boards.indexWhere((element) => element.id == board.id);
      _boards.replaceRange(boardIndex, boardIndex, [board]);
      return _boards[boardIndex];
    } catch (e) {
      return null;
    }
  }

  @override
  Future<FullBoard?> fetchFullBoard(String id) async {
    try {
      final board = _boards.firstWhere((element) => element.id == id);
      return FullBoard(board: board);
    } catch (e) {
      return null;
    }
  }
}
