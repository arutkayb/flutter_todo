import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board.dart';

class BoardCard extends StatelessWidget {
  final Board board;
  final Function() onTap;

  const BoardCard(this.board, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = board.name;
    final description = board.description ?? "";

    return Card(
      child: ListTile(
        leading: const Icon(Icons.dashboard),
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
