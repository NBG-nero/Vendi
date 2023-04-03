import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Admin/AdminScreens/main_category/main_category_view_model.dart';
import '../services/firebase_service.dart';
import '../utilities/constants/constants.dart';

class MainCatDropDown extends StatefulWidget {
  // final MainCategoryViewModel? viewModel;

  const MainCatDropDown({
    Key? key,
    // this.viewModel,
  }) : super(key: key);

  @override
  State<MainCatDropDown> createState() => _MainCatDropDownState();
}

class _MainCatDropDownState extends State<MainCatDropDown> {
  FirebaseService firebaseService = FirebaseService();
  QuerySnapshot? qSnapshot;
  Object? selectedValue;

  getCatList() {
    return firebaseService.categories.get().then((QuerySnapshot querySnapshot) {
      setState(() {
        qSnapshot = querySnapshot;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCatList();
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<QuerySnapshot>(
    //     future: widget.viewModel?.firebaseService.categories.get(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         return const Text('Something went wrong');
    //       }
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Text('Loading');
    //       }
    return DropdownButton(
      value: selectedValue,
      hint: Text("Select Category",
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: VendiColors.masterColor, fontSize: 17.sp)),
      items: qSnapshot?.docs.map((e) {
        return DropdownMenuItem<String>(
          value: e['catName'],
          child: Text(e['catName']),
        );
      }).toList(),
      onChanged: (val) {
        setState(() {
          selectedValue = val;
        });
        // widget.viewModel!.setSelectedVal(val);
        // widget.viewModel!.setnoCatselected(false);
      },
    );

    // });
  }
}
