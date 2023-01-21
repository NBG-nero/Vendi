// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:vendi/utilities/constants/constants.dart';

import '../utilities/margins/margins.dart';


class OnboardWidget extends StatelessWidget {
  final String? boardImage;
  final Widget? boardWidget;
  final String? boardText;
  final String? boardText2;
  final double? textSize;
  final double? textSize2;

  const OnboardWidget({
    Key? key,
    this.boardImage,
    this.boardWidget,
    this.boardText,
    this.boardText2,
    this.textSize,
    this.textSize2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: VendiColors.primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(boardText ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VendiColors.masterColor,
                    fontSize: textSize)),
                    YMargin(10.h,),
            Text(boardText2 ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: textSize2)),
          YMargin(20.h),
            SizedBox(
                height: 300.h,
                width: 300.w,
                child: SvgPicture.asset(boardImage!)),
          ],
        ));
  }
}
