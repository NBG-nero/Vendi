import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:developer';

import '../models/models.dart';
import '../utilities/constants/firestore_consts.dart';
import 'authservice.dart';

class FirebaseService {
final firebaseFirestore = FirebaseFirestore.instance;
  AuthService authService = AuthService();
  CollectionReference homeBanner =
      FirebaseFirestore.instance.collection('homeBanner');

  CollectionReference brandAd =
      FirebaseFirestore.instance.collection('brandAd');

  addUser(name, email, role) async {
    // final dataBase = FirebaseFirestore.instance;
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
    // checkUser();
  }


  // saveUser(User user) async {
  //   final userData = UserModel(name: user.displayName,email:user.email,role: "user") ;
  // }
}
