
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class BaseModel extends BaseViewModel {
  SharedPreferences? prefs; 
  initPrefs() async { 
    prefs = await SharedPreferences.getInstance();
  }
}
