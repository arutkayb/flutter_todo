// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardList _$BoardListFromJson(Map<String, dynamic> json) => BoardList(
      json['id'] as String,
      json['boardId'] as String,
    )
      ..name = json['name'] as String?
      ..dateCreated = json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String);

Map<String, dynamic> _$BoardListToJson(BoardList instance) => <String, dynamic>{
      'id': instance.id,
      'boardId': instance.boardId,
      'name': instance.name,
      'dateCreated': instance.dateCreated?.toIso8601String(),
    };
