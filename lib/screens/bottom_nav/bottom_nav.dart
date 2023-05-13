import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/utilities/constants/constants.dart';
import 'package:vendi/widgets/widgets.dart';

import 'bottom_nav_view_model.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
        viewModelBuilder: () => BottomNavViewModel(),
        onViewModelReady: (b) {
          b.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
            body: model.pages.elementAt(model.activeIndex!),
            bottomNavigationBar: Container(
                height: 60.h,
                color: VendiColors.masterColor,
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavItem(
                      icon: Icon(Icons.home_outlined,
                          size: 27.h, color: Colors.white),
                      iconActive: Icon(Icons.home_rounded,
                          size: 32.h, color: VendiColors.colorMap[600]),
                      isSelected: model.activeIndex == 0,
                      onTap: () {
                        model.setActiveIndex(0);
                      },
                    ),
                    BottomNavItem(
                      icon: Icon(IconlyLight.chat,
                          size: 25.h, color: Colors.white),
                      iconActive: Icon(
                        IconlyBold.chat,
                        color: VendiColors.colorMap[600],
                        size: 31.h,
                      ),
                      isSelected: model.activeIndex == 1,
                      onTap: () {
                        model.setActiveIndex(1);
                      },
                    ),
                    BottomNavItem(
                      icon: Icon(CupertinoIcons.cart,
                          size: 25.h, color: Colors.white),
                      iconActive: Icon(CupertinoIcons.cart_fill,
                          size: 30.h, color: VendiColors.colorMap[600]),
                      isSelected: model.activeIndex == 2,
                      onTap: () {
                        model.setActiveIndex(2);
                      },
                    ),
                    BottomNavItem(
                      icon: Icon(CupertinoIcons.person,
                          size: 27.h, color: Colors.white),
                      iconActive: Icon(CupertinoIcons.person_fill,
                          size: 31.h, color: VendiColors.colorMap[600]),
                      isSelected: model.activeIndex == 3,
                      onTap: () {
                        model.setActiveIndex(3);
                      },
                    ),
                  ],
                )),
          );
        });
  }
}
