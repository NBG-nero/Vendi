import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/constants/constants.dart';
import '../../widgets/widgets.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VendiColors.primaryColor,
      appBar: vendiAppBar(
          context: context,
          title: Text(
            "VENDI",
            style: TextStyle(
                letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.shopping_cart, size: 26.h))
          ]),
      body: ListView(
        children: [
         SearchWidget(),
        ],
      ),
    );
  }
}
