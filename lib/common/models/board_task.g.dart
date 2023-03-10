// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardTask _$BoardTaskFromJson(Map<String, dynamic> json) => BoardTask(
      json['id'] as String?,
      json['boardId'] as String,
      json['boardListId'] as String,
    )
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..label = $enumDecodeNullable(_$TaskLabelEnumMap, json['label'])
      ..dateStart = json['dateStart'] == null
          ? null
          : DateTime.parse(json['dateStart'] as String)
      ..dateEnd = json['dateEnd'] == null
          ? null
          : DateTime.parse(json['dateEnd'] as String)
      ..dateCreated = json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String);

Map<String, dynamic> _$BoardTaskToJson(BoardTask instance) => <String, dynamic>{
      'id': instance.id,
      'boardId': instance.boardId,
      'boardListId': instance.boardListId,
      'title': instance.title,
      'description': instance.description,
      'label': _$TaskLabelEnumMap[instance.label],
      'dateStart': instance.dateStart?.toIso8601String(),
      'dateEnd': instance.dateEnd?.toIso8601String(),
      'dateCreated': instance.dateCreated?.toIso8601String(),
    };

const _$TaskLabelEnumMap = {
  TaskLabel.critical: 'critical',
  TaskLabel.urgent: 'urgent',
  TaskLabel.normal: 'normal',
  TaskLabel.lowPriority: 'lowPriority',
};
