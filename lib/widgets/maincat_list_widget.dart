import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/utils.dart';

import '../Admin/AdminScreens/main_category/main_category_view_model.dart';
import '../utilities/margins/margins.dart';

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
        viewModel!.qSnapshot == null ? 
       const  Text("Loading.."):
        DropdownButton(
          value: viewModel!.selVal,
          hint: const Text('Select Category'),
          items: viewModel!.qSnapshot!.docs.map((e) {
            return DropdownMenuItem<String>(
              value: e['catName'],
              child: Text(e['catName']),
            );
          }).toList(),
          onChanged: (val) {
            viewModel!.setSelVal(val);
          },
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
                showWarningToast("Loading...");
                return const CircularProgressIndicator.adaptive();
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
