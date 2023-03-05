import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_event.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/board/widgets/board_list_view.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_starter/common/widgets/custom_text_input_widget.dart';
import 'package:flutter_starter/utils/dialog_utils.dart';
import 'package:flutter_starter/utils/navigation_utils.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late BoardScreenBloc _boardController;
  String? _createdBoardListName;
  final _pageViewController = PageController(
    initialPage: 0,
  );
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _boardController = context.read<BoardScreenBloc>();
    _boardController.add(FetchFullBoard());
  }

  @override
  Widget build(BuildContext context) {
    final boardName = _boardController.state.fullBoard.board.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(boardName),
      ),
      body: SafeArea(
        child: BlocBuilder<BoardScreenBloc, BoardScreenState>(
          builder: (context, state) {
            final boardLists = state.fullBoard.boardLists;
            final pageCount = (boardLists != null && boardLists.isNotEmpty)
                ? (boardLists.length + 1)
                : 1;
            return CustomCircularProgressIndicator(
              show: state.fetching,
              child: Column(
                children: [
                  Expanded(child: _getBoardLists(boardLists)),
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
      boardLists.sort((a, b) {
        if (a.dateCreated != null && b.dateCreated != null) {
          return a.dateCreated!.compareTo(b.dateCreated!) > 0 ? 1 : 0;
        } else {
          return 0;
        }
      });

      for (var boardList in boardLists) {
        List<BoardTask>? boardTasks;
        try {
          final List<BoardTask>? allTasks =
              _boardController.state.fullBoard.boardTasks;

          if (allTasks != null) {
            boardTasks = allTasks
                .where((boardTask) => boardTask.boardListId == boardList.id)
                .toList();
          }
        } catch (e) {
          // ignore
        }

        listWidgets.add(
          BoardListView(
            boardList,
            boardTasks,
            onDeleteList: () {
              if (boardTasks == null || boardTasks.isEmpty) {
                _boardController.add(DeleteBoardList(boardList));
              } else {
                showSafeDialog(context,
                    title: "delete_list".tr(),
                    content: "cannot_delete_list".tr());
              }
            },
            onAddListItem: () async {
              final boardId = _boardController.state.fullBoard.board.id;

              await NavigationUtils.navigateToBoardTask(
                context,
                BoardTask.withoutId(boardId, boardList.id),
                boardLists,
              );
            },
            onRenameList: (name) {
              _boardController
                  .add(UpdateBoardList(boardList.clone()..name = name));
            },
          ),
        );
      }
    }

    listWidgets.add(
      Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: GestureDetector(
            onTap: () {
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
            child: Text(
              "add_new_list".tr(),
            ),
          ),
        ),
      ),
    );

    return PageView(
      controller: _pageViewController,
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
    _pageViewController.dispose();
    super.dispose();
  }
}
