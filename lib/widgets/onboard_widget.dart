// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardWidget extends StatelessWidget {
  final String? boardImage;
  const OnboardWidget({
    Key? key,
    this.boardImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Center(child: SvgPicture.asset(boardImage!))
    );
  }
}
