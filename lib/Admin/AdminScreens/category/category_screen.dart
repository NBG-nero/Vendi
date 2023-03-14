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
    return Column(
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
                    border:
                        Border.all(color: VendiColors.exColor.withOpacity(0.8)),
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
            XMargin(20.w),
            Container(
              width: 200.w,
              child: TextField(),
            ),
          ],
        ),
        Divider(color: VendiColors.masterColor),
      ],
    );
  }
}
