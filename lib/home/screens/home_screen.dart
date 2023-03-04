import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_bloc.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_event.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_state.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_bloc.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_event.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_state.dart';
import 'package:flutter_starter/home/widgets/board_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenLoginBloc _loginController;
  late HomeScreenBoardBloc _boardController;

  @override
  void initState() {
    super.initState();
    _loginController = context.read<HomeScreenLoginBloc>();
    _boardController = context.read<HomeScreenBoardBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app_title').tr(),
        actions: [
          GestureDetector(
            onTap: _logout,
            child: Row(
              children: [
                const Text("log_out").tr(),
                const Icon(Icons.logout_outlined),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocListener<HomeScreenLoginBloc, HomeScreenLoginState>(
          listener: (context, state) {
            if (!state.isLoggedIn) {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
          child: BlocBuilder<HomeScreenBoardBloc, HomeScreenBoardState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  _boardController.add(FetchBoardsTriggered());
                },
                child: CustomCircularProgressIndicator(
                  show: state.fetching,
                  child: _getBoards(state.boards),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: _getFab(),
    );
  }

  Widget _getBoards(List<Board> boards) {
    List<Widget> widgets = List.empty(growable: true);

    if (boards.isEmpty) {
      widgets.add(SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: const Text(
            "no_boards_created_indicator",
            textAlign: TextAlign.center,
          ).tr(),
        ),
      ));
    } else {
      for (var board in boards) {
        widgets.add(BoardCard(board, _onBoardCardTap));
      }
    }

    return ListView(
      children: widgets,
    );
  }

  void _onBoardCardTap() {
    // TODO: navigate on tap
  }

  Widget _getFab() {
    return FloatingActionButton(
      heroTag: "createBoard",
      onPressed: () {
        // TODO: Navigate to board
      },
      child: const Icon(Icons.add),
    );
  }

  void _logout() {
    _loginController.add(LogOutPressed());
  }
}
