// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_task_alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardTaskAlarm _$BoardTaskAlarmFromJson(Map<String, dynamic> json) =>
    BoardTaskAlarm(
      json['id'] as String,
      json['boardTaskId'] as String,
    )..dueDate = json['dueDate'] == null
        ? null
        : DateTime.parse(json['dueDate'] as String);

Map<String, dynamic> _$BoardTaskAlarmToJson(BoardTaskAlarm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boardTaskId': instance.boardTaskId,
      'dueDate': instance.dueDate?.toIso8601String(),
    };
