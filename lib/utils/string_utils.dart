import 'dart:convert';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

String mapToJsonString(Map map) {
  return json.encode(map);
}

String generateUid() {
  return uuid.v4();
}
