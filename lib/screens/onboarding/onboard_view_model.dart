import 'dart:developer';

import '../../utilities/locator.dart';
import '../base_model.dart';

class OnboardViewModel extends BaseModel {
  final lo = locator<BaseModel>();

  double scrollerPosition = 0;
  setScroller(val) {
    scrollerPosition = val;
    notifyListeners();
  }

  bool isAuthend = false;
  authend(val) {
    isAuthend = val;
    lo.prefs?.setBool("isAuthen", isAuthend);
    log('isAuthed is $isAuthend');
    notifyListeners();
  }
}
