import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Admin/AdminScreens/sub_category/sub_cat_view_model.dart';
import '../services/firebase_service.dart';
import '../utilities/constants/constants.dart';

class SubCatDropDown extends StatefulWidget {
  final SubCategoryViewModel? viewModel;
  const SubCatDropDown({
    Key? key,
    this.viewModel,
  }) : super(key: key);

  @override
  State<SubCatDropDown> createState() => _SubCatDropDownState();
}

class _SubCatDropDownState extends State<SubCatDropDown> {
  FirebaseService firebaseService = FirebaseService();
  QuerySnapshot? subSnapshot;
  Object? selectedVal;

  getMainCatList() {
    return firebaseService.mainCat.get().then((QuerySnapshot querySnapshot) {
      setState(() {
        subSnapshot = querySnapshot;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMainCatList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedVal,
      hint: Text("Select Main Category",
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: VendiColors.masterColor, fontSize: 17.sp)),
      items: subSnapshot?.docs.map((e) {
        return DropdownMenuItem<String>(
          value: e['mainCategory'],
          child: Text(e['mainCategory']),
        );
      }).toList(),
      onChanged: (val) {
        setState(() {
          selectedVal = val;
        });
        // widget.viewModel!.setSelectedVal(val);
        // widget.viewModel!.setnoCatselected(false);
      },
    );
  }
}
