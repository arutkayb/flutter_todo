import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_event.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/board/widgets/board_list_view.dart';
import 'package:flutter_starter/common/models/board.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_starter/common/widgets/custom_text_input_widget.dart';
import 'package:flutter_starter/utils/dialog_utils.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late BoardScreenBloc _boardController;
  String? _createdBoardListName;
  final _controller = PageController(
    initialPage: 0,
  );
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _boardController = context.read<BoardScreenBloc>();
    _boardController.add(FetchBoardLists());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_boardController.state.board.name),
      ),
      body: SafeArea(
        child: BlocBuilder<BoardScreenBloc, BoardScreenState>(
          builder: (context, state) {
            final pageCount =
                (state.boardLists != null && state.boardLists!.isNotEmpty)
                    ? (state.boardLists!.length + 1)
                    : 1;
            return CustomCircularProgressIndicator(
              show: state.fetching,
              child: Column(
                children: [
                  Expanded(child: _getBoardLists(state.boardLists)),
                  PageViewDotIndicator(
                    currentItem: _selectedPage,
                    count: pageCount,
                    unselectedColor: Colors.black26,
                    selectedColor: Colors.blue,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getBoardLists(List<BoardList>? boardLists) {
    List<Widget> listWidgets = List.empty(growable: true);
    if (boardLists != null && boardLists.isNotEmpty) {
      for (var boardList in boardLists) {
        listWidgets.add(BoardListView(boardList, onDeleteList: () {
          //TODO
        }, onAddListItem: () {
          //TODO
        }));
      }
    }

    listWidgets.add(
      TextButton(
        onPressed: () {
          showSafeChooseActionTextInputDialog(
            context,
            title: "add_new_list".tr(),
            actionButton1: "complete".tr(),
            action1: () {
              _boardController.add(CreateBoardList(
                  _createdBoardListName ?? "board_list_name".tr()));
            },
            details: [
              CustomTextInputDetail(
                  label: "board_list_name".tr(),
                  onFieldChanged: (value) {
                    _createdBoardListName = value;
                  }),
            ],
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text(
            "add_new_list".tr(),
          ),
        ),
      ),
    );

    return PageView(
      controller: _controller,
      children: listWidgets,
      onPageChanged: (page) {
        setState(() {
          _selectedPage = page;
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
