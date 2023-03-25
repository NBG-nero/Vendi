import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Admin/AdminScreens/main_category/main_category_view_model.dart';
import '../utilities/constants/constants.dart';

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
      hint: Text("Select Category",
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: VendiColors.primaryColor, fontSize: 16.sp)),
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
