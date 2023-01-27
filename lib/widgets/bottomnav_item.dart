import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    );
  }
}
