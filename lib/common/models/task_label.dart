import 'package:json_annotation/json_annotation.dart';

enum TaskLabel {
  @JsonValue('critical')
  critical('critical'),
  @JsonValue('urgent')
  urgent('urgent'),
  @JsonValue('normal')
  normal('normal'),
  @JsonValue('lowPriority')
  lowPriority('lowPriority');

  final String value;

  const TaskLabel(this.value);

  static TaskLabel? fromValue(String label) {
    return values.firstWhere(
      (v) => v.value == label,
      orElse: () => TaskLabel.normal,
    );
  }
}
