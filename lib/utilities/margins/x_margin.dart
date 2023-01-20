import 'package:flutter/material.dart';

class XMargin extends StatelessWidget {
  final double value;
  const XMargin(
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}
