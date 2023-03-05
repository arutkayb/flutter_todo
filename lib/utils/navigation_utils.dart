import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/board/screens/board_screen.dart';
import 'package:flutter_starter/common/models/board.dart';

class NavigationUtils {
  static Future<dynamic> _navigateWithBloc(
    BuildContext context,
    BlocProvider provider,
  ) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => provider,
      ),
    );
  }

  static Future<void> navigateToBoard(
      BuildContext context, Board board) async {
    return await _navigateWithBloc(
        context,
        BlocProvider(
          create: (BuildContext context) => BoardScreenBloc(
            BoardScreenState(board),
          ),
          child: const BoardScreen(),
        ));
  }
}
