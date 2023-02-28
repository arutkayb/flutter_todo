// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_task_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardTaskComment _$BoardTaskCommentFromJson(Map<String, dynamic> json) =>
    BoardTaskComment(
      json['id'] as String,
      json['boardTaskId'] as String,
      json['userId'] as String,
    )
      ..dateCreated = json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String)
      ..content = json['content'] as String?;

Map<String, dynamic> _$BoardTaskCommentToJson(BoardTaskComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boardTaskId': instance.boardTaskId,
      'userId': instance.userId,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'content': instance.content,
    };
