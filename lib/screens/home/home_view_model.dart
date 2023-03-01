import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:vendi/screens/base_model.dart';

import '../../routes/router.gr.dart';
import '../../services/authservice.dart';
import '../../services/firebase_service.dart';
import '../../utilities/utils.dart';

class HomeViewModel extends BaseModel {
  FirebaseService firebaseService = FirebaseService();
  AuthService authService = AuthService();

  double bannerScrollPosition = 0;
  final List bannerImage = [];
  final List brandAds = [];

  setBannerScroller(val) {
    bannerScrollPosition = val;
    notifyListeners();
  }

  double brandScrollPosition = 0;
  setBrandScroller(val) {
    brandScrollPosition = val;
    notifyListeners();
  }

  List<String> categoryLabel = <String>[
    '*Picked For You',
    'Mobiles',
    'Fashion',
    'Groceries',
    // 'Electronics',
    // 'Kids',
  ];

  int index = 0;
  setIndex(val) {
    index = val;
    notifyListeners();
  }

  getBanners() {
    return firebaseService.homeBanner.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        bannerImage.add(doc['image']);
        notifyListeners();
      }
    });
  }

  getBrandAd() {
    return firebaseService.brandAd.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        brandAds.add(doc);
        notifyListeners();
      }
    });
  }

  signout(context) async {
    try {
      await initPrefs();
      log('sign out was called');
      await authService.signOut().then((data) {
        setBusy(true);
        setAuthenticated(false);
        log(isAuthenticated.toString());
        log('sign out successful');
        showToast('sign out successful');
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
      log(e.toString());
      showErrorToast('sign out unsuccessful');
      notifyListeners();
    }
  }
}
