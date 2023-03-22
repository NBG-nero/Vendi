

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Admin/AdminScreens/main_category/main_category_view_model.dart';

class MainCatDropDown extends StatelessWidget {
  final MainCategoryViewModel? viewModel;

  const MainCatDropDown({
    Key? key,
    this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: viewModel!.firebaseService.categories.get(),
      builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
        
        return const Placeholder();
      }
    );
  }
}
