import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'authservice.dart';

class FirebaseService {
  AuthService authService = AuthService();
  CollectionReference homeBanner =
      FirebaseFirestore.instance.collection('homeBanner');

  CollectionReference brandAd =
      FirebaseFirestore.instance.collection('brandAd');

  addUser(name, email) async {
    final dataBase = FirebaseFirestore.instance;
    final personalEmail = await authService.getCurrentEmail();
    log("Adduser was called");
    await dataBase
        .collection('userData')
        .doc(personalEmail)
        .set({"name": name, "email": email}).catchError((e) {
      log("AddUser failed");
    });
  }
}
