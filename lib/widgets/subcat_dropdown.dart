import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Admin/AdminScreens/sub_category/sub_cat_view_model.dart';
import '../utilities/constants/constants.dart';

class SubCatDropDown extends StatelessWidget {
  final SubCategoryViewModel? viewModel;
  const SubCatDropDown({
    Key? key,
    this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: viewModel!.selectedVal,
      hint: Text("Select Main Category",
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: VendiColors.masterColor, fontSize: 17.sp)),
      items: viewModel!.subSnapshot!.docs.map((e) {
        return DropdownMenuItem<String>(
          value: e['mainCategory'],
          child: Text(e['mainCategory']),
        );
      }).toList(),
      onChanged: (val) {
        viewModel!.setSelectedVal(val);
        viewModel!.setnoCatselected(false);
      },
    );
  }
}
