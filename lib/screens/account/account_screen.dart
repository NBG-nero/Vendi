import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VendiColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text("Accountscreen"), 
          ),
         

        ],
      ),
    );
  }
}
