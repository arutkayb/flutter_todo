import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board_task.dart';

class BoardTaskCard extends StatelessWidget {
  final BoardTask boardTask;
  final Function() onTap;

  const BoardTaskCard(this.boardTask, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = boardTask.title ?? "new_board_task".tr();
    final description = boardTask.description;

    return Card(
      child: ListTile(
        leading: const Icon(Icons.task_outlined),
        title: Text(title),
        subtitle: description == null ? null : Text(description),
        onTap: onTap,
      ),
    );
  }
}
