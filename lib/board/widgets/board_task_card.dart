import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board_task.dart';

class BoardTaskCard extends StatelessWidget {
  final BoardTask boardTask;
  final Function() onTap;

  const BoardTaskCard(this.boardTask, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = boardTask.title ?? "New Board Task";
    final description = boardTask.description ?? "New board task";

    return Card(
      child: ListTile(
        leading: const Icon(Icons.task_outlined),
        title: Text(title),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
