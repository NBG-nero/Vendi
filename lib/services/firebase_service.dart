import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import '../models/models.dart';
import 'authservice.dart';

class FirebaseService {
  AuthService authService = AuthService();
  CollectionReference homeBanner =
      FirebaseFirestore.instance.collection('homeBanner');

  CollectionReference brandAd =
      FirebaseFirestore.instance.collection('brandAd');

  addUser(name, email, role) async {
    final dataBase = FirebaseFirestore.instance;
    final personalEmail = await authService.getCurrentEmail();
    log("Adduser was called");
    final user = UserModel(name: name, email: email, role: role);

    await dataBase
        .collection('userData')
        .doc(personalEmail)
        // .set({"name": name, "email": email,"role":"admin"})
        .set(user.toJson())
        .catchError((e) {
      log("AddUser failed");
    });
  }
}
