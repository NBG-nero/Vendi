
import 'package:flutter/material.dart';

import '../utilities/constants/colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: VendiColors.primaryColor.withOpacity(0.9),
        child: Center(
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(VendiColors.secondaryColor),
          ),
        ));
  }
}
