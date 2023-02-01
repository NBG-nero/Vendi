import 'package:get_it/get_it.dart';
import 'package:vendi/screens/base_model.dart';
import 'package:vendi/screens/home/home_view_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() async {
  locator.registerLazySingleton<BaseModel>(() => BaseModel());
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
