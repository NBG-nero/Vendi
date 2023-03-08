import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/widgets.dart';
import 'admin_home_view_model.dart';

class AdminHomescreen extends StatelessWidget {
  const AdminHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHomeViewModel>.reactive(
        viewModelBuilder: () => AdminHomeViewModel(),
        onModelReady: (ah) {
          ah.setInitialised(true);
        },
        builder: (context, model, child) {
          return AdminScaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Sample'),
            ),
            sideBar: SideBar(
              items: const [
                AdminMenuItem(
                  title: 'Dashboard',
                  route: '/',
                  icon: Icons.dashboard,
                ),
                AdminMenuItem(
                  title: 'Top Level',
                  icon: Icons.file_copy,
                  children: [
                    AdminMenuItem(
                      title: 'Second Level Item 1',
                      route: '/secondLevelItem1',
                    ),
                    AdminMenuItem(
                      title: 'Second Level Item 2',
                      route: '/secondLevelItem2',
                    ),
                    AdminMenuItem(
                      title: 'Third Level',
                      children: [
                        AdminMenuItem(
                          title: 'Third Level Item 1',
                          route: '/thirdLevelItem1',
                        ),
                        AdminMenuItem(
                          title: 'Third Level Item 2',
                          route: '/thirdLevelItem2',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              selectedRoute: '/',
              onSelected: (item) {
                if (item.route != null) {
                  Navigator.of(context).pushNamed(item.route!);
                }
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
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Dashboard',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  VButton(
                    onPressed: () {
                      model.signout(context);
                    },
                    buttontext: "log out",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
