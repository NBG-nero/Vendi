import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/margins/margins.dart';

class VTextField extends StatelessWidget {
    final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final VoidCallback? onSuffixPressed;
  final Widget? suffix;
  final Function(String)? validator;
  final TextEditingController? controller;
  final int? maxlines;
  final bool isMandatory;
  final Widget? prefix;
  final AutovalidateMode? autovalidateMode;
  const VTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.errorText,
    required this.obscureText,
    this.onSuffixPressed,
    this.suffix,
    this.validator,
    this.controller,
    this.maxlines,
    required this.isMandatory,
    this.prefix,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment:CrossAxisAlignment.start, 
      children:[ 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:2.0),
          child: Row( 
            children:[ 
              Text(labelText ??""), 
              YMargin(7.h),
            ]
          ),
        ),
      ]
    );
  }
}
