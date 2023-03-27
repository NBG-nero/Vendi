import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/utils.dart';

import '../Admin/AdminScreens/main_category/main_category_view_model.dart';
import '../utilities/margins/margins.dart';
import 'widgets.dart';

class MainCategoryList extends StatelessWidget {
  final MainCategoryViewModel? viewModel;

  const MainCategoryList({
    Key? key,
    this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        viewModel!.qSnapshot == null
            ? const Text("Loading..")
            : Row(
                children: [
                  DropdownButton(
                    value: viewModel!.selVal,
                    hint: Text(
                      'Select Category',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: VendiColors.masterColor, fontSize: 17.sp),
                    ),
                    items: viewModel!.rSnapshot!.docs.map((e) {
                      return DropdownMenuItem<String>(
                        value: e['catName'],
                        child: Text(e['catName']),
                      );
                    }).toList(),
                    onChanged: (val) {
                      viewModel!.setSelVal(val);
                    },
                  ),
                  XMargin(20.w),
                  VButton(
                    onPressed: () {
                      viewModel!.setSelVal(null);
                    },
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                          color: VendiColors.masterColor,
                        )),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 35.h,
                    color: VendiColors.masterColor,
                    child: Text(
                      'Show All',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: VendiColors.primaryColor),
                    ),
                  ),
                ],
              ),
        YMargin(10.h),
        StreamBuilder<QuerySnapshot>(
            stream: viewModel!.firebaseService.mainCat
                .where('category', isEqualTo: viewModel!.selVal)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                showErrorToast(snapshot.error.toString());

                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                log("Loading...");
                // showWarningToast("Loading...");
                // return const CircularProgressIndicator.adaptive();
              }
              if (snapshot.data!.size == 0) {
                showErrorToast("No Main Categories Added");

                return const Text('No Main categories Added');
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 3.w,
                    mainAxisSpacing: 3.h),
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  String mainCatText = data["mainCategory"];
                  return Card(
                      color: VendiColors.masterColor.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            height: 40.h,
                            child: Center(
                              child: Text(
                                mainCatText,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        overflow:
                                            mainCatText.characters.length > 24
                                                ? TextOverflow.ellipsis
                                                : TextOverflow.visible),
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              );
            }),
      ],
    );
  }
}

//mobiles under elect accessories 
//laptop under elect devices
//pendrives under elect accessories 
//Fruits under groceries 
//vegetables under groceries 
//tv under home appliances 
//washing mashine under home appliances 

