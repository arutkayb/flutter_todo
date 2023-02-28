import 'package:json_annotation/json_annotation.dart';

part 'board_list.g.dart';

@JsonSerializable()
class BoardList {
  // primary key
  String id;

  // foreign key
  String boardId;

  String? name;

  BoardList(this.id, this.boardId);

  factory BoardList.fromJson(Map<String, dynamic> json) => _$BoardListFromJson(json);

  Map<String, dynamic> toJson() => _$BoardListToJson(this);
}
