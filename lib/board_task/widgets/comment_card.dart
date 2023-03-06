import 'package:flutter/material.dart';
import 'package:flutter_starter/board_task/models/extended_board_task_comment.dart';
import 'package:flutter_starter/utils/time_utils.dart';

class CommentCard extends StatelessWidget {
  final ExtendedBoardTaskComment extendedBoardTaskComment;
  final Function() onDeleteTap;
  final _controller = TextEditingController();

  CommentCard(this.extendedBoardTaskComment, this.onDeleteTap, {Key? key})
      : super(key: key) {
    _controller.text = extendedBoardTaskComment.boardTaskComment.content ?? " ";
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = extendedBoardTaskComment.commentUser?.email ?? "";

    final date = extendedBoardTaskComment.boardTaskComment.dateCreated != null
        ? formatDate(extendedBoardTaskComment.boardTaskComment.dateCreated!)
        : "";
    return Card(
      child: Column(
        children: [
          ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDeleteTap();
              },
            ),
            title: TextField(
              controller: _controller,
              decoration:
                  InputDecoration(labelText: date, border: InputBorder.none),
              readOnly: true,
              maxLines: null,
            ),
          ),
          Align(alignment: Alignment.centerRight, child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(userEmail, style: const TextStyle(fontSize: 10),),
          )),
        ],
      ),
    );
  }
}
