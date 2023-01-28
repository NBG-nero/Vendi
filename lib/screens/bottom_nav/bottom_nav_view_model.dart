import 'package:flutter/material.dart';

import '../base_model.dart';
import '../screens.dart';

class BottomNavViewModel extends BaseModel {
  int? activeIndex = 0;
  setActiveIndex(value) {
    activeIndex = value;
    notifyListeners();
  }

  List<Widget> pages = [
    const Homescreen(),
    const Messagescreen(),
    const Cartscreen(),
    const Accountscreen()
  ];
}
