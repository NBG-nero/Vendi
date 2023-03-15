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
  final double? height;


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
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed!,
        color: color ?? VendiColors.primaryColorswatch.shade700,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: sideColor ?? Colors.transparent),
            ),
        minWidth: width ?? MediaQuery.of(context).size.width * 0.9,
        height: height,
        padding: padding ?? const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: child ??
            Text(buttontext ?? 'buttonText',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: buttonTextCor ?? Colors.white,
                    )));
  }
}
