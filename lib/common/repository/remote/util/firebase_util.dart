import 'package:firebase_database/firebase_database.dart';

Map<String, dynamic> getMapFromSnapshot(DataSnapshot snapshot){
  return Map<String, dynamic>.from(snapshot.value as Map);
}