


import '../base_model.dart';

class OnboardViewModel extends BaseModel {
  

  double scrollerPosition = 0;
  setScroller(val) {
    scrollerPosition = val;
    notifyListeners();
  }


}
