import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../utilities/constants/colors.dart';

class SignupLoadingView extends StatelessWidget {
  const SignupLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SignUpscreen(),
        Container(
            color: VendiColors.masterColor.withOpacity(0.7),
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
