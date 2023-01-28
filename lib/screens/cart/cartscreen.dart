import 'package:flutter/material.dart';
import 'package:vendi/utilities/constants/constants.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      backgroundColor: VendiColors.primaryColor,
      body: const Center(child: Text("Cartscreen")),

    );
  }
}
