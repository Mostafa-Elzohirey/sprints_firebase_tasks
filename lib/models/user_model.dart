import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? id;
  String? email;
  String? name;
  String? password;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
  });
  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? snapShotOptions,
  ) {
    final data = snapshot.data();
    return UserModel(
      id: data?['id'],
      email: data?['email'],
      name: data?['name'],
      password: data?['password'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'id': FirebaseAuth.instance.currentUser?.uid ?? '',
      'email': email ?? '',
      'name': name ?? '',
      'password': password ?? '',
    };
  }

}
