import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sprints_firebase_tasks/models/data.dart';

import 'package:sprints_firebase_tasks/models/user_model.dart';

class FirestoreServices {
  FirestoreServices._privateConstructor();
  static final _fireStore = FirebaseFirestore.instance;

  //create
  static Future<UserModel> addUser(UserModel user) async {
    await _fireStore.collection('users').doc(user.id).set(user.toFirestore());
    return user;
  }

  //fetch
  static Future<UserModel> getUser(UserModel userModel) async {
    final retrievedUser =
        await _fireStore.collection('users').doc(userModel.id).get();
    final user = UserModel.fromFirestore(retrievedUser, null);
    return user;
  }

  //update
  static Future<void> updateUser(UserModel user) async {
    await _fireStore
        .collection('users')
        .doc(user.id)
        .update(user.toFirestore());
  }

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
