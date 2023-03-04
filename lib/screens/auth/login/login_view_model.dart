import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:vendi/services/authservice.dart';
import 'package:vendi/services/firebase_service.dart';
import 'package:vendi/utilities/constants/constants.dart';
import 'package:vendi/utilities/utils.dart';

import '../../../models/models.dart';
import '../../../routes/router.gr.dart';
import '../../../utilities/constants/firestore_consts.dart';
import '../../base_model.dart';

class LoginViewModel extends BaseModel {
  AuthService authService = AuthService();
  FirebaseService firebaseService = FirebaseService();
  final GoogleSignIn googleSignIn = GoogleSignIn();

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
          .then((data) async {
        setBusy(true);
        setAuthenticated(true);
        prefs?.setString(AppConstants.emailVal, email);
        log(isAuthenticated.toString());
        var id = prefs?.getString(FirestoreConstants.id);
        await firebaseService.firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .doc(id)
            .get()
            .then((DocumentSnapshot document) async {
          if (document.exists) {
            if (document.get('role') == "user") {
              log("role is user");
              await prefs?.setString(FirestoreConstants.role, role);
              AutoRouter.of(context).pushAndPopUntil(const BottomNav(),
                  predicate: (route) => false);
              notifyListeners();
            } else {
              log("role is admin");
              await prefs?.setString(FirestoreConstants.role, role);
              notifyListeners();
            }
          } else {
            log('doc doesnt exist');
          }
        });
        log('login successful');
        showToast('login successful');
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
      log(e.toString());
      showErrorToast('Incorrect email or password');
      notifyListeners();
    }
  }

  googleUserSignIn(context) async {
    try {
      await initPrefs();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        setBusy(true);
        GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        User? firebaseUser =
            (await authService.auth.signInWithCredential(credential)).user;
        if (firebaseUser != null) {
          setBusy(true);
          await firebaseService.firebaseFirestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(firebaseUser.uid)
              .get()
              .then((DocumentSnapshot document) async {
            if (document.exists) {
              final user = UserModel(
                  id: FirestoreConstants.id,
                  name: FirestoreConstants.nickname,
                  email: FirestoreConstants.email,
                  role: FirestoreConstants.role);

              firebaseService.firebaseFirestore
                  .collection(FirestoreConstants.pathUserCollection)
                  .doc(firebaseUser.uid)
                  .set({
                user.id!: firebaseUser.uid,
                user.name!: firebaseUser.displayName,
                user.email!: firebaseUser.email,
                user.role!: "user",
                'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
              }).catchError((e) {
                log(e.toString());
              });
              User? currentUser = firebaseUser;
              await prefs?.setString(FirestoreConstants.id, currentUser.uid);
              await prefs?.setString(
                  FirestoreConstants.nickname, currentUser.displayName ?? "");
              await prefs?.setString(
                  FirestoreConstants.email, currentUser.email ?? "");
              if (document.get('role') == "user") {
                log("role is user");
                await prefs?.setString(FirestoreConstants.role, user.role!);
                // AutoRouter.of(context).pushAndPopUntil(const BottomNav(),
                //     predicate: (route) => false);
                // notifyListeners();
              } else {
                log("role is admin");
                await prefs?.setString(FirestoreConstants.role, user.role!);
                notifyListeners();
              }
            } else {
              log("document is empty");
            }
            setBusy(false);
            log('sign in successful');
            showToast("sign in successful");
            setAuthenticated(true);
            log(isAuthenticated.toString());
            notifyListeners();
          });
 
        } else {
          setBusy(false);
          showErrorToast("Sign in failed");
          notifyListeners();
        }
      } else {
        setBusy(false);
        showErrorToast("Sign in canceled");
        notifyListeners();
      }
    }
     catch (e) {
      setBusy(false);
      log(e.toString());
      showErrorToast('an error occured');
      notifyListeners();
    }
  }
}
