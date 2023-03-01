import 'package:json_annotation/json_annotation.dart';

part 'board.g.dart';

@JsonSerializable()
class Board {
  // primary key
  String id;

  // foreign key
  String userId;

  String? name;
  String? description;

  Board(this.id, this.userId);

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  Map<String, dynamic> toJson() => _$BoardToJson(this);
}