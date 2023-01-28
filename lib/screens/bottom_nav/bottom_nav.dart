import 'package:flutter/material.dart';
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
        onModelReady: (b) {
          b.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
            body: model.pages.elementAt(model.activeIndex!),
            bottomNavigationBar: Container(
                height: 50.h,
                color: VendiColors.masterColor,
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavItem(
                      icon: Icon(Icons.home_rounded,
                          size: 26.h, color: Colors.white),
                      iconActive: Icon(Icons.home_rounded,
                          size: 30.h, color: VendiColors.colorMap[600]),
                      isSelected: model.activeIndex == 0,
                      onTap: () {
                        model.setActiveIndex(0);
                      },
                    ),
                    BottomNavItem(
                      icon: Icon(Icons.shopping_cart_rounded,
                          size: 24.h, color: Colors.white),
                      iconActive: Icon(Icons.shopping_cart_rounded,
                          size: 28.5.h, color: VendiColors.colorMap[600]),
                      isSelected: model.activeIndex == 1,
                      onTap: () {
                        model.setActiveIndex(1);
                      },
                    ),
                    BottomNavItem(
                      icon: Icon(Icons.chat_bubble_rounded,
                          size: 24.h, color: Colors.white),
                      iconActive: Icon(
                        Icons.chat_bubble_rounded,
                        color: VendiColors.colorMap[600],
                        size: 28.h,
                      ),
                      isSelected: model.activeIndex == 2,
                      onTap: () {
                        model.setActiveIndex(2);
                      },
                    ),
                    BottomNavItem(
                      icon: Icon(Icons.person_rounded,
                          size: 26.h, color: Colors.white),
                      iconActive: Icon(Icons.person_rounded,
                          size: 30.h, color: VendiColors.colorMap[600]),
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
