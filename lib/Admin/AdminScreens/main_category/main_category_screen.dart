

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/constants/constants.dart';

class MainCategoryscreen extends StatelessWidget {
  static const String id = "Main-Category";

  const MainCategoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'MainCategory',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
                Divider(thickness: 1.h, color: VendiColors.masterColor),
                Divider(thickness: 1.h, color: VendiColors.masterColor),


      ],
    );
  }
}