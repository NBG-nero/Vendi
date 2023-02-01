import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_widget.dart';
import 'utilities/locator.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setUpLocator();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Vendi());
}
