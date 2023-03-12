import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/Admin/AdminScreens/admin_screens.dart';

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
          return
          
           AdminScaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Sample'),
            ),
            sideBar: SideBar(
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
                      title: 'Second Level Item 2',
                      route: '/secondLevelItem2',
                    ),
                  ],
                ),
              ],
              selectedRoute: model.selectedRoute ?? AdminHomescreen.id,
              onSelected: (item) {
                model.setSelected(item, context);
                      // if (item.route != null) {
                // Navigator.of(context).pushNamed(item.route!);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context)=> model.selectedScreen!)
                // );
                // }
              },
              header: Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xff444444),
                child: const Center(
                  child: Text(
                    'header',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              footer: Container(
                height: 50,
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
            ),
            body: SingleChildScrollView(
              child: model.selectedScreen,
              //  Column(
              //   children: [
              //     Container(
              //       alignment: Alignment.topLeft,
              //       padding: const EdgeInsets.all(10),
              //       child: const Text(
              //         'Dashboard',
              //         style: TextStyle(
              //           fontWeight: FontWeight.w700,
              //           fontSize: 36,
              //         ),
              //       ),
              //     ),
              //     VButton(
              //       onPressed: () {
              //         model.signout(context);
              //       },
              //       buttontext: "log out",
              //     ),

              //   ],
              // ),
            ),
          );
        });
  }
}
