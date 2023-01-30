import 'package:vendi/screens/base_model.dart';

class HomeViewModel extends BaseModel {
  double scrollPosition = 0;
  setScroller(val) {
    scrollPosition = val;
    notifyListeners();
  }
}
