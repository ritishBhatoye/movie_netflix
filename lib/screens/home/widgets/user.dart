import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String id;
  final String name;
  // final String username;
  final String email;
  final String? profileImageUrl;
  final String? password;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,

    // required this.username,
    this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      // 'username': username,
      'profileImageUrl': profileImageUrl,
      'email': name,
      "password":password,

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'] as String,
        name: map['name'] as String,
        // username: map['username'] as String,
        profileImageUrl: map['profileImageUrl'] != null
            ? map['profileImageUrl'] as String
            : null,
        email: map['email'] as String,
        password: map['password'] as String
        // bio: map['bio'] != null ? map['bio'] as String : null,
        // link: map['link'] != null ? map['link'] as String : null,
        // followers: List.from((map['followers'] as List)),
        // following: List.from((map['following'] as List))
        );
  }
factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
  final data=document.data();
  return UserModel(
    id: document.id,
    email: data!["email"],
   name: data!["name"],
   password:data!["password"],
  //  profileImageUrl: data!["profi"]
   );
}
  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //       id: map['id'] as String,
  //       name: map['name'] as String,
  //       // username: map['username'] as String,
  //       profileImageUrl: map['profileImageUrl'] != null
  //           ? map['profileImageUrl'] as String
  //           : null,
  //       // bio: map['bio'] != null ? map['bio'] as String : null,
  //       // link: map['link'] != null ? map['link'] as String : null,
  //       // followers: List.from((map['followers'] as List)),
  //       // following: List.from((map['following'] as List))
  //       );
  // }
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
