import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board.dart';

class BoardCard extends StatelessWidget {
  final Board board;
  final Function() onTap;
  final Function onDelete;

  const BoardCard(this.board,
      {required this.onTap, required this.onDelete, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = board.name;
    final description = board.description ?? "";

    return Card(
      child: ListTile(
        leading: const Icon(Icons.dashboard),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            onDelete();
          },
        ),
        title: Text(
          title,
          maxLines: 1,
        ),
        subtitle: Text(
          description,
          maxLines: 1,
        ),
        onTap: onTap,
      ),
    );
  }
}
