import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/screens/splash/splash_view_model.dart';

import '../../routes/router.gr.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (s) {
          s.setInitialised(true);
          Future.delayed(const Duration(seconds: 5), (() {
            // bool? isLoggedIn = s.prefs?.getBool('loggedin') ;
            // isLoggedIn! ?
            // AutoRouter.of(context).pushAndPopUntil(const Homescreen(),
            //     predicate: (route) => false) :

            AutoRouter.of(context).pushAndPopUntil(const Onboarding(),
                predicate: (route) => false) 
                
                ;
          }));
        },
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: Colors.blue.shade50,
              body: Center(
                  child: Text(
                "VENDI",
                style: TextStyle(
                    fontSize: 100.sp,
                    fontStyle: FontStyle.italic,
                    color: Colors.amber[600]),
              )));
        });
  }
}
