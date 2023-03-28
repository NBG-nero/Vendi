import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'dart:developer';

import '../models/models.dart';
import '../utilities/constants/firestore_consts.dart';
import 'authservice.dart';

class FirebaseService {
  final firebaseFirestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage firebaseStorage =
      firebase_storage.FirebaseStorage.instance;
  // final firebaseStorage = FirebaseStorage.instance;
  AuthService authService = AuthService();
  CollectionReference homeBanner =
      FirebaseFirestore.instance.collection('homeBanner');

  CollectionReference brandAd =
      FirebaseFirestore.instance.collection('brandAd');

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  CollectionReference mainCat =
      FirebaseFirestore.instance.collection('mainCategories');

  addUser(name, email, role) async {
    final uid = await authService.getCurrentUid();
    log("Adduser was called");
    final user = UserModel(id: uid, name: name, email: email, role: role);
    await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .doc(uid)
        .set(user.toJson())
        .catchError((e) {
      log("AddUser failed");
    });
  }

  Future<void> saveCategory(
      {CollectionReference? reference,
      Map<String, dynamic>? data,
      String? docName}) {
    return reference!.doc(docName).set(data);
  }
}
