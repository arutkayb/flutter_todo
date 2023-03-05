import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';

class FullBoard {
  final Board board;
  final List<BoardTask>? boardTasks;
  final List<BoardList>? boardLists;

  FullBoard({
    required this.board,
    this.boardTasks,
    this.boardLists,
  });
}
