import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/board/screens/board_screen.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_bloc.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_state.dart';
import 'package:flutter_starter/board_task/screens/board_task_screen.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/models/full_board.dart';

class NavigationUtils {
  static Future<void> navigateToBoard(BuildContext context, Board board) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (BuildContext context) => BoardScreenBloc(
            BoardScreenState(FullBoard(board: board)),
          ),
          child: const BoardScreen(),
        ),
      ),
    );
  }

  static Future<BoardTask?> navigateToBoardTask(BuildContext context,
      BoardTask boardTask, List<BoardList> boardLists) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (BuildContext context) => BoardTaskScreenBloc(
            BoardTaskScreenState(boardTask, boardLists),
          ),
          child: const BoardTaskScreen(),
        ),
      ),
    );
  }
}
