import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/screens/base_model.dart';
import 'package:vendi/screens/splash/splash_view_model.dart';
import 'package:vendi/utilities/constants/constants.dart';

import '../../routes/router.gr.dart';
import '../../utilities/locator.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // final lo = locator<BaseModel>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (s) {
          s.setInitialised(true);
          Future.delayed(const Duration(seconds: 5), (() {
            // bool? authenticated = lo.prefs?.getBool(AppConstants.logInVal);
            bool? authenticated = s.lo?.getBool("isAuthen");

            log('$authenticated');

            authenticated == true
                ? AutoRouter.of(context).pushAndPopUntil(const Loginscreen(),
                    predicate: (route) => false)
                : AutoRouter.of(context).pushAndPopUntil(const Onboarding(),
                    predicate: (route) => false);
          }));
        },
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: VendiColors.masterColor,
              body: Center(
                  child: Text(
                "VENDI",
                style: TextStyle(
                    fontSize: 100.sp,
                    fontStyle: FontStyle.italic,
                    color: VendiColors.tertiaryColor),
              )));
        });
  }
}
