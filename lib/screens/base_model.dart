import 'dart:developer';


import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/utilities/constants/app_constants.dart';

class BaseModel extends BaseViewModel {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  

  SharedPreferences? prefs;
  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool isAuthenticated = false;
  setAuthenticated(val) async {
    await initPrefs();
    isAuthenticated = val;
    await prefs?.setBool(AppConstants.logInVal, isAuthenticated);
    log('isAuthenticated is $isAuthenticated');
    notifyListeners();
  }

  loadlogggedIn() async {
    await initPrefs();
    bool? authend = prefs?.getBool(AppConstants.logInVal);
    log('$authend');
    return authend;
  }
}
