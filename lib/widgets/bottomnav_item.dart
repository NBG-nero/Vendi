import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItem extends StatelessWidget {
  final String? icon;
  final String? iconActive;
  final bool isSelected;
  final Function? onTap;
  const BottomNavItem({
    Key? key,
    this.icon,
    this.iconActive,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        width: 50.w,
        margin: const EdgeInsets.all(4),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
                child: InkWell(
                    onTap: () {
                      onTap!();
                    },
                    child: Center(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isSelected
                                ? SizedBox(
                                    height: 30.h,
                                    width: 30.w,
                                    // child: SvgPicture.asset(),
                                  )
                                : SizedBox()
                          ]),
                    )))));
  }
}
