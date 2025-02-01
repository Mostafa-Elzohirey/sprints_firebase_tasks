import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sprints_firebase_tasks/models/data.dart';

import 'package:sprints_firebase_tasks/models/user_model.dart';

class FirestoreServices {
  FirestoreServices._privateConstructor();
  static final _fireStore = FirebaseFirestore.instance;

  static Future<void> addData(Map<String, String> data) async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await _fireStore.collection('data').doc(id).set(data);
  }

  static Future<Data> getData(String id) async {
    final result = await _fireStore.collection('data').doc(id).get();
    final data = Data.fromMap(result.data()!);
    return data;
  }
}
