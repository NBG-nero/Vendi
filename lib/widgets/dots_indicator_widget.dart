import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../utilities/constants/colors.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    Key? key,
    required this.position,
    required this.dotscount,
  }) : super(key: key);

  final int? position;
  // final double? position;
  final int dotscount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DotsIndicator(
            position: position ?? 0,
            dotsCount: dotscount,
            decorator: DotsDecorator(
              spacing: const EdgeInsets.all(2),
              size: const Size.square(6),
              activeSize: const Size(12, 6),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              color: VendiColors.secondaryColor.withOpacity(0.5),
              activeColor: VendiColors.colorMap[900],
            ),
          ),
        ),
      ],
    );
  }
}
