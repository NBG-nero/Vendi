
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/constants/colors.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    Key? key,
    required this.position,
  }) : super(key: key);

  final double? position;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 11.h,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DotsIndicator(
              position: position ?? 0,
              dotsCount: 3,
              decorator: DotsDecorator(
                  spacing: const EdgeInsets.all(2),
                  size: const Size.square(6),
                  activeSize: const Size(12, 6),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  color: VendiColors.secondaryColor.withOpacity(0.5),
                  activeColor: VendiColors.colorMap[900],),
            ),
          ),
        ],
      ),
    );
  }
}
