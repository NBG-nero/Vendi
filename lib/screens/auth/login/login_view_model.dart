import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendi/services/authservice.dart';
import 'package:vendi/utilities/constants/constants.dart';
import 'package:vendi/utilities/utils.dart';

import '../../../routes/router.gr.dart';
import '../../base_model.dart';

class LoginViewModel extends BaseModel {
  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool hidePassword = true;

  toogleHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  logIn(email, password, context, role) async {
    try {
      await initPrefs();
      log('login was called');
      await authService.signInWithEmailAndPassword(email, password).then((val) {
        setBusy(true);
        setAuthenticated(true);
        prefs?.setString(AppConstants.emailVal, email);
        log(isAuthenticated.toString());
        log('login successful');
        AutoRouter.of(context)
            .pushAndPopUntil(const BottomNav(), predicate: (route) => false);
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
      showErrorToast('Incorrect email or password');
      notifyListeners();
    }
  }
}
