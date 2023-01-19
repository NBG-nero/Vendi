import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vendi/widgets/widgets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(onPageChanged: (val) {}, children: [
        OnboardWidget(
          boardText: "Welcome\nTo Vendi",
          textSize: 28.sp,
          boardText2:"+10 Million Products\n+100 categories\n+20 Brands" ,
          textSize2: 22.sp,
          boardImage: "assets/images/2.svg",
        ),
        OnboardWidget(
          boardText: "",
          boardImage: "assets/images/3.svg",
        ),
        OnboardWidget(
          boardImage: "assets/images/4.svg",
        ),
        OnboardWidget(
          boardImage: "assets/images/1.svg",
        )
      ]),
    );
  }
}
