import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board.dart';

class BoardCard extends StatelessWidget {
  final Board board;
  final Function() onTap;

  const BoardCard(this.board, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = board.name ?? "New Board";
    final description = board.description ?? "New board";

    return Card(
      child: ListTile(
        leading: const Icon(Icons.dashboard),
        title: Text(title),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
