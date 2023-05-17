// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/screens/splash/splash_view_model.dart';
import 'package:vendi/utilities/constants/constants.dart';
import 'package:vendi/utilities/utils.dart';

import '../../routes/router.gr.dart';
import '../../utilities/constants/firestore_consts.dart';

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
        onViewModelReady: (s) {
          s.setInitialised(true);
          Future.delayed(const Duration(seconds: 5), (() async {
            await s.initPrefs();
            final bool? authenticated = s.prefs?.getBool(AppConstants.logInVal);
            log('authenticated is $authenticated');
            if (authenticated == true) {
              var id = await s.authService.getCurrentUid();
              log('$id is id');
              await s.firebaseService.firebaseFirestore
                  .collection(FirestoreConstants.pathUserCollection)
                  .doc(id)
                  .get()
                  .then((DocumentSnapshot document) async {
                if (document.exists) {
                  if (document.get("role") == "user") {
                    log("role is user");
                    AutoRouter.of(context).pushAndPopUntil(const BottomNav(),
                        predicate: (route) => false);
                  } else {
                    log("role is admin");
                    AutoRouter.of(context).pushAndPopUntil(
                        const AdminAppWidget(),
                        predicate: (route) => false);
                  }
                } else {
                  log('doc doesnt exist');
                  showToast("document doesnt exist");
                }
              });
            } else {
              AutoRouter.of(context).pushAndPopUntil(const Onboarding(),
                  predicate: (route) => false);
            }
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
