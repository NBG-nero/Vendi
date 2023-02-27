import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendi/utilities/utils.dart';

import '../../../models/models.dart';
import '../../../routes/router.gr.dart';
import '../../../services/authservice.dart';
import '../../../services/firebase_service.dart';
import '../../base_model.dart';

class SignUpViewModel extends BaseModel {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool hidePassword = true;

  toogleHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  AuthService authService = AuthService();
  FirebaseService firebaseService = FirebaseService();

  signUp(name, email, password, role, context) async {
    try {
      initPrefs();
      log('sign up was called');
      await authService
          .createUserWithEmailAndPassword(name, email, password, role)
          .then((data) {
        setBusy(true);
        firebaseService.addUser(name, email, role);
        log('user added');
        setBusy(false);
        AutoRouter.of(context)
            .pushAndPopUntil(const Loginscreen(), predicate: (route) => false);
        notifyListeners();
      });
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
      showErrorToast(e.toString());
      notifyListeners();
    }
  }
}
