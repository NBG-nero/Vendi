import 'package:flutter/material.dart';

import 'AdminScreens/home/admin_home.dart';

class AdminAppWidget extends StatelessWidget {
  const AdminAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminHomescreen(),
    );
  }
}