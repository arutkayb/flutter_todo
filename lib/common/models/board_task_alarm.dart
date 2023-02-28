import 'package:json_annotation/json_annotation.dart';

part 'board_task_alarm.g.dart';

@JsonSerializable()
class BoardTaskAlarm {
  // primary key
  String id;

  // foreign key
  String boardTaskId;

  DateTime? dueDate;

  BoardTaskAlarm(this.id, this.boardTaskId);

  factory BoardTaskAlarm.fromJson(Map<String, dynamic> json) => _$BoardTaskAlarmFromJson(json);

  Map<String, dynamic> toJson() => _$BoardTaskAlarmToJson(this);
}
