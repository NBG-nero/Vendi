import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../utilities/constants/colors.dart';

class LoginLoadingView extends StatelessWidget {
  const LoginLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Loginscreen(),
        Container(
            color: VendiColors.primaryColor.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor:
                    AlwaysStoppedAnimation<Color>(VendiColors.secondaryColor),
              ),
            )),
      ],
    );
  }
}
