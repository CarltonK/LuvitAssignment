import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:luvit/models/models.dart';

class DatabaseProvider {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  Stream<LuvitModel> fetchDataStreamByRef() {
    DatabaseReference reference = _database.ref('data');
    return reference.onValue.map((DatabaseEvent event) {
      final Map<dynamic, dynamic> dataMap = event.snapshot.value as Map;
      return luvitModelFromJson(jsonEncode(dataMap));
    });
  }
}
