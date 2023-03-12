
import 'package:flutter/material.dart';

class Categoryscreen extends StatelessWidget {
  static const String id = "category";

  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(10),
      child: const Text(
        'Category',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36,
        ),
      ),
    );
  }
}