import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board_task_comment.dart';
import 'package:flutter_starter/utils/time_utils.dart';

class CommentCard extends StatelessWidget {
  final BoardTaskComment boardTaskComment;
  final Function() onDeleteTap;
  final _controller = TextEditingController();

  CommentCard(this.boardTaskComment, this.onDeleteTap, {Key? key})
      : super(key: key) {
    _controller.text = boardTaskComment.content ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            onDeleteTap();
          },
        ),
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: boardTaskComment.dateCreated != null
                ? formatDate(boardTaskComment.dateCreated!)
                : null,
            border: InputBorder.none
          ),
          readOnly: true,
          maxLines: null,
        ),
      ),
    );
  }
}
