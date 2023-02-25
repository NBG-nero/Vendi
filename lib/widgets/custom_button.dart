import 'package:flutter/material.dart';
import 'package:vendi/utilities/constants/colors.dart';

class VButton extends StatelessWidget {
  final Color? color;
  final double? minWidth;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final ShapeBorder? shape;
  final String? buttontext;
  final Color? buttonTextCor;
  final Color? sideColor;
  final double? width;

  const VButton({
    Key? key,
    this.color,
    this.minWidth,
    this.onPressed,
    this.padding,
    this.child,
    this.shape,
    this.buttontext,
    this.buttonTextCor,
    this.sideColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton( 
      onPressed: onPressed!, 
      color:color?? VendiColors.primaryColorswatch.shade700
    );
  }
}
