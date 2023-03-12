import 'package:flutter/material.dart';
import 'package:vendi/screens/home/home_view_model.dart';

import '../admin_screens.dart';

class AdminHomeViewModel extends HomeViewModel {
  Widget? selectedScreen = const Dashboardscreen();
  String? selectedRoute = Dashboardscreen.id;
  setSelected(item, context) {
    switch (item.route) {
      case Dashboardscreen.id:
        selectedScreen = const Dashboardscreen();
        selectedRoute = Dashboardscreen.id;
        notifyListeners();
        break;
      case Categoryscreen.id:
        selectedScreen = const Categoryscreen();
        selectedRoute = Categoryscreen.id;

        notifyListeners();
        break;
      case MainCategoryscreen.id:
        selectedScreen = const MainCategoryscreen();
        selectedRoute = MainCategoryscreen.id;
        notifyListeners();
        break;
      case SubCategoryscreen.id:
        selectedScreen = const SubCategoryscreen();
        selectedRoute = SubCategoryscreen.id;
        notifyListeners();
        break;
    }

    notifyListeners();
  }
}
