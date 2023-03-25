
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
          return DropdownButton(
            value: viewModel!.selectedValue,
            hint: const Text("Select Category"),
            items: viewModel!.qSnapshot!.docs.map((e) {
              return DropdownMenuItem<String>(
                value: e['catName'],
                child: Text(e['catName']),
              );
            }).toList(),
            onChanged: (val) {
              viewModel!.setSelectedVal(val);
              viewModel!.setnoCatselected(false);
            },
          );
       
  }
}
