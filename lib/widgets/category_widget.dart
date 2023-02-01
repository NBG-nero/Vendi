import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/margins/y_margin.dart';

import '../screens/home/home_view_model.dart';
import '../utilities/locator.dart';

class CategoryWidget extends StatefulWidget {
  // final IndexedWidgetBuilder? itemBuilder;
  // final int? itemCount;
  // final Widget? label;
  // final VoidCallback? onPressed;
  // final int? index;
  const CategoryWidget({
    Key? key,
    // this.itemBuilder,
    // this.itemCount,
    // this.label,
    // this.onPressed,
    // this.index,
  }) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final lo = locator<HomeViewModel>();

  // List<String> categoryLabel = <String>[
  //   '*Picked For You',
  //   'Mobiles',
  //   'Fashion',
  //   'Groceries',
  //   'Electronic',
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          YMargin(18.h),
                   Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Stores For You",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20.sp)),
              ),
            ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8,0,8,8),
            child: SizedBox(
              height: 40.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: lo.categoryLabel.length,
                        itemBuilder: (context, index) {
                          String cat = lo.categoryLabel[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: ActionChip(
                              shape: RoundedRectangleBorder( 
                                borderRadius: BorderRadius.circular(6)
                              ),
                              backgroundColor: index == lo.index
                                  ? VendiColors.masterColor
                                  : Colors.grey.shade400,
                              // disabledColor: Colors.grey.shade300,
                              label: Text(cat,
                                  style: TextStyle(
                                      fontSize: 14.h,
                                      color: index == lo.index
                                          ? Colors.white
                                          : Colors.black)),
                              onPressed: () {
                                setState(() {
                                  lo.setIndex(index);
                                });
                              },
                            ),
                          );
                        }),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyLight.arrowDown),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
