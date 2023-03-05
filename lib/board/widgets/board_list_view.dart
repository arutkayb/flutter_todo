import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/board/widgets/board_task_card.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/common/widgets/custom_text_input_widget.dart';
import 'package:flutter_starter/utils/dialog_utils.dart';

class BoardListView extends StatefulWidget {
  final BoardList boardList;
  final List<BoardTask>? boardTasks;
  final Function onDeleteList;
  final Function(String) onRenameList;
  final Function onAddListItem;
  final Function(BoardTask) onBoardTaskTap;

  const BoardListView(this.boardList, this.boardTasks,
      {required this.onDeleteList,
      required this.onAddListItem,
      required this.onRenameList,
      required this.onBoardTaskTap,
      Key? key})
      : super(key: key);

  @override
  State<BoardListView> createState() => _BoardListViewState();
}

class _BoardListViewState extends State<BoardListView> {
  late String _listName;

  @override
  void initState() {
    super.initState();

    _listName = widget.boardList.name!;
  }

  @override
  Widget build(BuildContext context) {
    final Widget header = Container(
      decoration: const BoxDecoration(
        color: Color(0x44003547),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListTile(
        trailing: PopupMenuButton<void Function()>(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: () {
                  widget.onDeleteList();
                },
                child: const Text("delete_list").tr(),
              ),
              PopupMenuItem(
                value: () {
                  showSafeChooseActionTextInputDialog(
                    context,
                    title: "rename_list".tr(),
                    actionButton1: "complete".tr(),
                    action1: () {
                      if (_listName.isNotEmpty &&
                          _listName != widget.boardList.name) {
                        widget.onRenameList(_listName);
                      }
                    },
                    details: [
                      CustomTextInputDetail(
                          onFieldChanged: (value) {
                            _listName = value;
                          },
                          label: "board_list_name".tr())
                    ],
                  );
                },
                child: const Text("rename_list").tr(),
              ),
            ];
          },
          onSelected: (fn) => fn(),
        ),
        title: Text(
          widget.boardList.name ?? "new_list".tr(),
          textAlign: TextAlign.center,
        ),
      ),
    );

    final Widget addListItem = Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xCCED8B16),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              widget.onAddListItem();
            },
          ),
        ),
      ),
    );

    if (widget.boardTasks != null && widget.boardTasks!.isNotEmpty) {
      widget.boardTasks!.sort((a, b) {
        if (a.dateCreated != null && b.dateCreated != null) {
          return a.dateCreated!.compareTo(b.dateCreated!) > 0 ? 1 : 0;
        } else {
          return 0;
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          header,
          (widget.boardTasks == null || widget.boardTasks!.isEmpty)
              ? Container()
              : Column(
                  children: widget.boardTasks!
                      .map((boardTask) => BoardTaskCard(boardTask, () {
                            widget.onBoardTaskTap(boardTask);
                          }))
                      .toList(),
                ),
          addListItem,
        ],
      ),
    );
  }
}
