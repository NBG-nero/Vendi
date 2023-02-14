import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendi/screens/base_model.dart';

import '../../services/firebase_service.dart';

class HomeViewModel extends BaseModel {
  FirebaseService firebaseService = FirebaseService();
  double bannerScrollPosition = 0;
  final List bannerImage = [];
  bool bannersLoading = false;
  setBannersloading(val) {
    bannersLoading = val;
    notifyListeners();
  }

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
    setBannersloading(true);
    return firebaseService.homeBanner.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setBannersloading(true);

        bannerImage.add(doc['image']);
        setBannersloading(false);
        notifyListeners();
      }
    });
  }
}
