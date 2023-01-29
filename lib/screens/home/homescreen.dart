import 'package:flutter/material.dart';
import 'package:vendi/widgets/custom_appbar.dart';

import '../../utilities/constants/constants.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VendiColors.primaryColor,
      // appBar: AppBar(),
      appBar: vendiAppBar(
        context: context,
        child: const Text("VENDI",
            style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
      ),
      body: const Center(child: Text("Homescreen")),
    );
  }
}
