import 'package:flutter/material.dart';

class YMargin extends StatelessWidget {
  final double value;
  const YMargin(this.value,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}
