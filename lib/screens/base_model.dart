import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/utilities/constants/app_constants.dart';

class BaseModel extends BaseViewModel {
  SharedPreferences? prefs;
  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool isAuthenticated = false;
  loggedIn(val) {
    isAuthenticated = val;
    prefs?.setBool(AppConstants.logInVal, isAuthenticated);
    log('isAuthenticated is $isAuthenticated');
    notifyListeners();
  }
}
