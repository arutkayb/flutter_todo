import 'package:flutter_starter/utils/string_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_task_comment.g.dart';

@JsonSerializable()
class BoardTaskComment {
  // primary key
  String id;

  // foreign key
  String boardId;

  // foreign key
  String boardTaskId;

  // foreign key
  String userId;

  DateTime? dateCreated;
  String? content;

  BoardTaskComment(
    this.id,
    this.userId,
    this.boardId,
    this.boardTaskId,
  );

  BoardTaskComment.withUid(
    this.userId,
    this.boardId,
    this.boardTaskId,
  ) : id = generateUid();

  factory BoardTaskComment.fromJson(Map<String, dynamic> json) =>
      _$BoardTaskCommentFromJson(json);

  Map<String, dynamic> toJson() => _$BoardTaskCommentToJson(this);
}
