import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/screens/onboarding/onboard_view_model.dart';

import 'package:vendi/widgets/widgets.dart';

import '../../utilities/constants/constants.dart';
import '../../utilities/margins/margins.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardViewModel>.reactive(
        viewModelBuilder: () => OnboardViewModel(),
        onModelReady: (o) {
          o.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
            body: Stack(
              children: [
                PageView(
                    onPageChanged: (val) {
                      model.scrollerPosition = val.toDouble();
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DotsIndicator(
                          dotsCount: 4,
                          position: model.scrollerPosition,
                          decorator: DotsDecorator(
                            activeColor: VendiColors.masterColor,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
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
