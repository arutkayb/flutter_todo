// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      json['id'] as String,
      json['userId'] as String,
      json['name'] as String,
      json['description'] as String?,
    );

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
    };
