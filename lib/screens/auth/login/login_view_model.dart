import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:vendi/models/user.dart';
import 'package:vendi/services/authservice.dart';
import 'package:vendi/services/firebase_service.dart';
import 'package:vendi/utilities/constants/constants.dart';
import 'package:vendi/utilities/utils.dart';

import '../../../routes/router.gr.dart';
import '../../../utilities/constants/firestore_consts.dart';
import '../../base_model.dart';

class LoginViewModel extends BaseModel {
  AuthService authService = AuthService();
  FirebaseService firebaseService = FirebaseService();
  final formKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool hidePassword = true;

  toogleHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  logIn(email, password, role, context) async {
    try {
      await initPrefs();
      log('login was called');
      await authService
          .signInWithEmailAndPassword(email, password, role)
          .then((data) {
        setBusy(true);
        setAuthenticated(true);
        prefs?.setString(AppConstants.emailVal, email);
        log(isAuthenticated.toString());
      });
      final uid = await authService.getCurrentUid();
      await prefs?.setString(FirestoreConstants.id, uid);
      var id = prefs?.getString(FirestoreConstants.id);
      await firebaseService.firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(id)
          .get()
          .then((DocumentSnapshot document) {
        if (document.exists) {
          if (document.get('role') == "user") {
            log("role is user");
            AutoRouter.of(context).pushAndPopUntil(const BottomNav(),
                predicate: (route) => false);
            notifyListeners();
          } else {
            log("role is admin");
          }
        } else {
          log('doc doesnt exist');
        }
      });
      log('login successful');
      showToast('login successful');
    } on PlatformException catch (e) {
      setBusy(false);
      showErrorToast(e.message.toString());
    } on TimeoutException catch (e) {
      setBusy(false);
      showErrorToast(e.message.toString());
    } on HttpException catch (e) {
      setBusy(false);
      showErrorToast(e.message.toString());
    } on FirebaseAuthException catch (e) {
      setBusy(false);
      showErrorToast(e.message.toString());
    } on SocketException catch (e) {
      setBusy(false);
      showErrorToast(e.message.toString());
    } catch (e) {
      setBusy(false);

      log(e.toString());
      showErrorToast('Incorrect email or password');
      notifyListeners();
    }
  }
}
