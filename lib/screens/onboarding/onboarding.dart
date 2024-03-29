import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/screens/onboarding/onboard_view_model.dart';

import 'package:vendi/widgets/widgets.dart';

import '../../routes/router.gr.dart';
import '../../utilities/constants/constants.dart';
import '../../utilities/locator.dart';
import '../../utilities/margins/margins.dart';
import '../base_model.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final lo = locator<BaseModel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardViewModel>.reactive(
        viewModelBuilder: () => OnboardViewModel(),
        onViewModelReady: (o) {
          o.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
            body: Stack(
              children: [
                PageView(
                    onPageChanged: (val) {
                      model.setScroller(val.toDouble());
                    },
                    children: [
                      OnboardWidget(
                        boardText: "Welcome\nTo Vendi",
                        textSize: 28.sp,
                        boardText2:
                            "+10 Million Products\n+100 categories\n+20 Brands",
                        textSize2: 22.sp,
                        boardImage: "assets/images/2.svg",
                      ),
                      OnboardWidget(
                        boardText: "7 - 14 Days Return",
                        textSize: 30.sp,
                        boardText2: "Satisfaction Guaranteed",
                        textSize2: 20.sp,
                        boardImage: "assets/images/3.svg",
                      ),
                      OnboardWidget(
                        boardText: "Find your Favourite Products",
                        textSize: 30.sp,
                        boardImage: "assets/images/4.svg",
                      ),
                      OnboardWidget(
                        boardText: "Experience & Enjoy\nSmart Shopping",
                        textSize: 30.sp,
                        boardImage: "assets/images/1.svg",
                      ),
                    ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: VendiColors.exColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DotsIndicator(
                          dotsCount: 4,
                          position: model.scrollerPosition.toInt(),
                          decorator: DotsDecorator(
                            activeColor: VendiColors.masterColor,
                            color: Colors.white,
                          ),
                        ),
                        model.scrollerPosition == 3
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)))),
                                    backgroundColor: MaterialStateProperty.all(
                                        VendiColors.colorMap[900])),
                                onPressed: () {
                                  // model.loggedIn(true);

                                  AutoRouter.of(context).pushAndPopUntil(
                                      const Loginscreen(),
                                      predicate: (route) => false);
                                  //the whole onPressed here should normall just navigate to login.
                                  //.then onLoggedIn will have this code
                                  // which will then set loggedIn to true.
                                  //.allowing splash to directly nav to bottomnav on app start
                                },
                                child: const Text("START SHOPPING"))
                            : TextButton(
                                onPressed: () {
                                  if (model.scrollerPosition == 0 ||
                                      model.scrollerPosition == 1 ||
                                      model.scrollerPosition == 2) {
                                    AutoRouter.of(context).pushAndPopUntil(
                                        const Loginscreen(),
                                        predicate: (route) => false);
                                  }
                                },
                                child: Text("SKIP TO THE APP >",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: VendiColors.secondaryColor)),
                              ),
                        YMargin(10.h)
                      ],
                    )),
              ],
            ),
          );
        });
  }
}
