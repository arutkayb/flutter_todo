import 'package:flutter_starter/common/models/task_label.dart';

abstract class BoardTaskScreenEvent {}

class SaveBoardTask extends BoardTaskScreenEvent {
  String? boardListId;
  String title;
  String? description;
  TaskLabel? label;
  DateTime? dateStart;
  DateTime? dateEnd;

  SaveBoardTask({
    required this.boardListId,
    required this.title,
    this.description,
    this.label,
    this.dateStart,
    this.dateEnd,
  });
}
