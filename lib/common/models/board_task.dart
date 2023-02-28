import 'package:flutter_starter/common/models/task_label.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_task.g.dart';

@JsonSerializable()
class BoardTask {
  // primary key
  String id;

  // foreign key
  String boardListId;

  String? title;
  String? description;
  TaskLabel? label;
  DateTime? dateStart;
  DateTime? dateEnd;


  BoardTask(this.id, this.boardListId);

  factory BoardTask.fromJson(Map<String, dynamic> json) => _$BoardTaskFromJson(json);

  Map<String, dynamic> toJson() => _$BoardTaskToJson(this);
}
