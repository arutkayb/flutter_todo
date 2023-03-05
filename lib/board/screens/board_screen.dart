import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/widgets/custom_circular_progress_indicator.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late BoardScreenBloc _boardController;

  @override
  void initState() {
    super.initState();
    _boardController = context.read<BoardScreenBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<BoardScreenBloc, BoardScreenState>(
          builder: (context, state) {
            return CustomCircularProgressIndicator(
              show: state.fetching,
              child: _getBoardLists(state.board),
            );
          },
        ),
      ),
    );
  }

  Widget _getBoardLists(Board? board) {
    return Container();
  }
}
