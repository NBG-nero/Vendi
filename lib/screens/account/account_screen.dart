import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VendiColors.primaryColor,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Accountscreen"),
          ),
        ],
      ),
    );
  }
}
