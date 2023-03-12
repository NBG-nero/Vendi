import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/Admin/AdminScreens/admin_screens.dart';

import '../../../utilities/constants/constants.dart';
import '../../../utilities/margins/margins.dart';
import '../../../widgets/widgets.dart';
import 'admin_home_view_model.dart';

class AdminHomescreen extends StatefulWidget {
  static const String id = 'Home-menu';
  const AdminHomescreen({super.key});

  @override
  State<AdminHomescreen> createState() => _AdminHomescreenState();
}

class _AdminHomescreenState extends State<AdminHomescreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHomeViewModel>.reactive(
        viewModelBuilder: () => AdminHomeViewModel(),
        onModelReady: (ah) {
          ah.setInitialised(true);
        },
        builder: (context, model, child) {
          return AdminScaffold(
            backgroundColor: VendiColors.primaryColor,
            appBar: AppBar(
              backgroundColor: VendiColors.masterColor,
              centerTitle: true,
              title: Text(
                "VENDI ADMIN",
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp),
              ),
            ),
            sideBar: SideBar(
              backgroundColor: VendiColors.primaryColor,
              borderColor: VendiColors.primaryColor,
              activeBackgroundColor: VendiColors.masterColor,
              items: const [
                AdminMenuItem(
                  title: 'Dashboard',
                  route: Dashboardscreen.id,
                  icon: Icons.dashboard,
                ),
                AdminMenuItem(
                  title: 'Categories',
                  icon: Icons.file_copy,
                  children: [
                    AdminMenuItem(
                      title: 'Category',
                      route: Categoryscreen.id,
                    ),
                    AdminMenuItem(
                      title: 'MainCategory',
                      route: MainCategoryscreen.id,
                    ),
                    AdminMenuItem(
                      title: 'SubCategory',
                      route: SubCategoryscreen.id,
                    ),
                  ],
                ),
              ],
              selectedRoute: model.selectedRoute ?? AdminHomescreen.id,
              onSelected: (item) {
                model.setSelected(item, context);
              },
              header: Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xff444444),
                child: const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              footer: Container(
                height: 120.h,
                color: VendiColors.primaryColor,
                child: Column(
                  children: [
                    VButton(
                      width: MediaQuery.of(context).size.width * 0.3,
                      onPressed: () {
                        model.signout(context);
                      },
                      buttontext: "log out",
                    ),
                    YMargin(10.h),
                    Container(
                      height: 50.h,
                      width: double.infinity,
                      color: const Color(0xff444444),
                      child: const Center(
                        child: Text(
                          'footer',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: model.selectedScreen,
            ),
          );
        });
  }
}
