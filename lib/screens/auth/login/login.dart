
import 'package:flutter/material.dart';
import 'package:vendi/utilities/constants/colors.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VendiColors.masterColor,
    );
  }
}