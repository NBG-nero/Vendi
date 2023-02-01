import 'package:vendi/screens/base_model.dart';

class HomeViewModel extends BaseModel {
  double bannerScrollPosition = 0;
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
}
