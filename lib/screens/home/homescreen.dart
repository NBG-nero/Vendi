import 'package:flutter/material.dart';

import '../../utilities/constants/constants.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: VendiColors.primaryColor,

      body: const Center(child: Text("Homescreen")),
    );
  }
}
