import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_starter/common/widgets/custom_text_input_widget.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_bloc.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_event.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_state.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_bloc.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_event.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_state.dart';
import 'package:flutter_starter/home/widgets/board_card.dart';
import 'package:flutter_starter/utils/dialog_utils.dart';
import 'package:flutter_starter/utils/navigation_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenLoginBloc _loginController;
  late HomeScreenBoardBloc _boardController;
  String? newBoardName;
  String? newBoardDescription;

  @override
  void initState() {
    super.initState();
    _loginController = context.read<HomeScreenLoginBloc>();
    _boardController = context.read<HomeScreenBoardBloc>();
    _boardController.add(FetchBoardsTriggered());
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

    boards.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!) < 0 ? 1 : 0);

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
        widgets.add(BoardCard(board, () {
          _onBoardCardTap(board);
        }));
      }
    }

    return ListView(
      children: widgets,
    );
  }

  void _onBoardCardTap(Board board) async {
    await NavigationUtils.navigateToBoard(context, board);
    _boardController.add(BoardUpdated());
  }

  Widget _getFab() {
    return FloatingActionButton(
      heroTag: "createBoard",
      onPressed: () {
        _createNewBoard();
      },
      child: const Icon(Icons.add),
    );
  }

  void _createNewBoard() {
    List<CustomTextInputDetail> details = List.empty(growable: true);
    details.add(CustomTextInputDetail(
        label: "board_name".tr(),
        onFieldChanged: (value) {
          newBoardName = value;
        }));

    details.add(CustomTextInputDetail(
        label: "board_description".tr(),
        onFieldChanged: (value) {
          newBoardDescription = value;
        }));

    showSafeChooseActionTextInputDialog(
      context,
      title: "create_new_board".tr(),
      actionButton1: "complete".tr(),
      action1: () {
        _boardController.add(BoardCreated(
            newBoardName ?? "new_board".tr(), newBoardDescription));
      },
      details: details,
    );
  }

  void _logout() {
    _loginController.add(LogOutPressed());
  }
}
