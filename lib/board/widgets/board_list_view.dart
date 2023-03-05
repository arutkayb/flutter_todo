import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board_list.dart';

class BoardListView extends StatelessWidget {
  final BoardList boardList;
  final Function onDeleteList;
  final Function onAddListItem;

  const BoardListView(this.boardList,
      {required this.onDeleteList, required this.onAddListItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget header = Container(
      decoration: const BoxDecoration(
        color: Color(0x44003547),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            onDeleteList();
          },
        ),
        title: Text(
          boardList.name ?? "new_list".tr(),
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
              onAddListItem();
            },
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [header, addListItem],
      ),
    );
  }
}
