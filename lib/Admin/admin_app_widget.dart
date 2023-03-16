import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'AdminScreens/home/admin_home.dart';

class AdminAppWidget extends StatelessWidget {
  const AdminAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const  AdminHomescreen(),
      builder:EasyLoading.init()
    );
  }
}
