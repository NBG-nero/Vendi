import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

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
        const OnboardWidget(
          boardImage: "assets/images/2.svg",
        ),
        const OnboardWidget(
          boardImage: "assets/images/3.svg",
        ),
        const OnboardWidget(
          boardImage: "assets/images/4.svg",
        ),
        const OnboardWidget(
          boardImage: "assets/images/1.svg",
        )
      ]),
    );
  }
}
