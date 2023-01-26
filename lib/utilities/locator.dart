import 'package:get_it/get_it.dart';
import 'package:vendi/screens/base_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() async {
  locator.registerLazySingleton<BaseModel>(() => BaseModel());
}
