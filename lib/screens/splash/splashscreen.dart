import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue.shade50,
        body: Center(
            child: Text(
      "VENDI",
      style: TextStyle(
          fontSize: 100.sp,
          fontStyle: FontStyle.italic,
          color: Colors.amber[600]),
    )));
  }
}
