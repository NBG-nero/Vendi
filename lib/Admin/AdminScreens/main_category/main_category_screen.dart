

import 'package:flutter/material.dart';

class MainCategoryscreen extends StatelessWidget {
  static const String id = "Main-Category";

  const MainCategoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(10),
      child: const Text(
        'MainCategory',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36,
        ),
      ),
    );
  }
}