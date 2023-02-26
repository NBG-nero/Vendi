import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vendi/utilities/constants/colors.dart';

import '../utilities/margins/margins.dart';

class VTextField extends StatelessWidget {
  final Color? hintColor;
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
    this.hintColor,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Row(
            children: [
              Text(labelText ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: VendiColors.secondaryColor)),
              YMargin(7.h),
              isMandatory
                  ? Text('*',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold))
                  : const Text(''),
            ],
          ),
        ),
        YMargin(10.h),
        TextFormField(
          autovalidateMode: autovalidateMode,
          maxLines: maxlines ?? 1,
          obscureText: obscureText,
          controller: controller,
          validator: (val) => validator!(val!),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: hintColor?? VendiColors.primaryColor.withOpacity(0.7) ),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            errorText: errorText,
            errorMaxLines: 3,
            hintText: hintText,
            suffix: suffix == null
                ? null
                : GestureDetector(
                    onTap: () {
                      onSuffixPressed!();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 10),
                      child: suffix,
                    ),
                  ),
            prefixIcon: prefix == null
                ? null
                :
                // ignore: avoid_unnecessary_containers
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: prefix,
                    ),
                  ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: VendiColors.exColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: VendiColors.exColor, style: BorderStyle.solid),
            ),
          ),
        ),
      ],
    );
  }
}
