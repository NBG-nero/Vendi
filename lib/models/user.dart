import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vendi/utilities/constants/firestore_consts.dart';

part 'user.g.dart';

enum Usertype { admin, user }

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
  });
  factory UserModel.from(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    String name = '';
    String email = '';
    String role = '';
    try {
      name = doc.get(FirestoreConstants.nickname);
    } catch (e) {
      log(e.toString());
    }
    try {
      email = doc.get(FirestoreConstants.email);
    } catch (e) {
      log(e.toString());
    }

    try {
      role = doc.get(FirestoreConstants.role);
    } catch (e) {
      log(e.toString());
    }
    return UserModel(id: doc.id, name: name, email: email, role: role);
  }

  @override
  String toString() =>
      'LoginModel(id:$id,name:$name,email: $email, password: $password,role: $role )';
}
