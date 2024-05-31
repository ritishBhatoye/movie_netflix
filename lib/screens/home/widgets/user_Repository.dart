import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:doctor_booking_app/models/user_model_firebase.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home/widgets/user.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<void> createUser(UserModel user) async {
  //   try {
  //     await _db.collection('users').add(user.toJson());
  //     debugPrint('User added to Firestore');
  //   } catch (e) {
  //     debugPrint('Error adding user to Firestore: $e');
  //   }
  // }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('Users').where('Email', isEqualTo: email).get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUserData() async {
    final snapshot = await _db.collection('Users').get();

    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}