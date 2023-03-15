import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendi/utilities/margins/margins.dart';

import '../../../utilities/constants/constants.dart';
import '../../../widgets/widgets.dart';

class Categoryscreen extends StatelessWidget {
  static const String id = "category";

  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
          ),
          Divider(color: VendiColors.masterColor),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: VendiColors.exColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: VendiColors.exColor.withOpacity(0.8)),
                    ),
                    child: Center(
                      child: Text(
                        "Category Image",
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(),
                      ),
                    ),
                  ),
                  YMargin(10.h),
                  VButton(
                    color: VendiColors.masterColor,
                    padding: const EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 38.h,
                    onPressed: () {},
                    child: Text(
                      'Upload Image',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: VendiColors.primaryColor),
                    ),
                  ),
                ],
              ),
              XMargin(10.w),
              Column(children: [
                SizedBox(
                  width: 180.w,
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text('Enter Category Name'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                YMargin(10.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                            color: VendiColors.masterColor,
                          )),
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: 35.h,
                      color: VendiColors.primaryColorswatch[100],
                      child: Text(
                        'Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: VendiColors.masterColor),
                      ),
                    ),
                    XMargin(40.w),
                    VButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                            color: VendiColors.masterColor,
                          )),
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: 35.h,
                      color: VendiColors.primaryColorswatch[100],
                      child: Text(
                        'Save',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: VendiColors.masterColor),
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
          Divider(color: VendiColors.masterColor),
        ],
      ),
    );
  }
}
