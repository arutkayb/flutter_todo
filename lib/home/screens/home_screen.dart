import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
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
import 'package:flutter_starter/utils/file_utils.dart';
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
            child: _getPopupMenu(),
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

  Widget _getPopupMenu() {
    return PopupMenuButton<void Function()>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: _exportJson,
            child: const Text("export_json").tr(),
          ),
          PopupMenuItem(
            onTap: _onSwitchTheme,
            child: const Text("switch_theme").tr(),
          ),
          PopupMenuItem(
            onTap: _logout,
            child: const Text(
              "log_out",
              style: TextStyle(color: Colors.red),
            ).tr(),
          ),
        ];
      },
      onSelected: (fn) => fn(),
    );
  }

  Future<void> _exportJson() async {
    String res = await _boardController.exportData();
    try {
      String path = await saveStringAsFile(res);

      showSafeDialog(context,
          title: "export_successful".tr(),
          content: "${'export_successful_description'.tr()}:'$path'");
    } catch (e) {
      showSafeDialog(context, title: "failed".tr(), content: e.toString());
    }
  }

  void _onSwitchTheme() async {
    final bool res = await _boardController.switchTheme();
    if (res) {
      if (context.mounted) {
        Phoenix.rebirth(context);
      }
    }
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
        widgets.add(BoardCard(
          board,
          onTap: () {
            _onBoardCardTap(board);
          },
          onDelete: () {
            _onBoardCardDelete(board);
          },
        ));
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

  void _onBoardCardDelete(Board board) async {
    showSafeConfirmationDialog(context,
        title: "delete_board_title".tr(),
        content: "delete_board_content".tr(), confirmAction: () {
      _boardController.add(BoardDeleted(board));
    });
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
