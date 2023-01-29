import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendi/utilities/constants/colors.dart';

PreferredSize vendiAppBar({
  required BuildContext context,
  Widget? child,
  Widget? leading,
  bool? automaticallyImplyLeading,
  Widget? title,
  List<Widget>? actions,
  Widget? flexibleSpace,
  PreferredSizeWidget? bottom,
  double? elevation,
  double? scrolledUnderElevation,
  ScrollNotificationPredicate? notificationPredicate,
  Color? shadowColor,
  Color? surfaceTintColor,
  ShapeBorder? shape,
  Color? backgroundColor,
  Color? foregroundColor,
  Brightness? brightness,
  IconThemeData? iconTheme,
  IconThemeData? actionsIconTheme,
  TextTheme? textTheme,
  bool? primary,
  bool? centerTitle,
  bool? excludeHeaderSemantics,
  double? titleSpacing,
  double? toolbarOpacity,
  double? bottomOpacity,
  Size? preferredSize,
  double? toolbarHeight,
  double? leadingWidth,
  bool? backwardsCompatibility,
  TextStyle? toolbarTextStyle,
  TextStyle? titleTextStyle,
}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(65.h),
      child: Container(
        width: double.infinity,
        color: VendiColors.secondaryColor,
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 10,
                  left: 10,
                ),
                child: child)),
      ));
}
