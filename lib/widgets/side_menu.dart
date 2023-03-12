import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vendi/utilities/margins/margins.dart';

import 'package:vendi/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.57,
        child: Stack(
          children: [
            ListView(
              children: [
                // YMargin(50.h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width * 0.57,
                    color: Colors.grey,
                    child: const Center(
                      child: Text("Menu"),
                    ),
                  ),
                ),
                SideMenuItem(
                  title: "Dashboard",
                  icon: Icons.dashboard,
                  onTap: () {},
                ),
                ExpansionTile(
                  leading: const Icon(Icons.category_outlined),
                  title: const Text('Category'),
                  children: [
                    SideMenuItem(
                      title: "Category",
                      icon: Icons.category,
                      onTap: () {},
                    ),
                    SideMenuItem(
                      title: "Main-category",
                      icon: Icons.category,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 0,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width * 0.57,
                  color: Colors.grey,
                  child: const Center(
                    child: Text("footer"),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
