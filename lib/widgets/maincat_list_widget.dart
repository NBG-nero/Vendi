import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/utils.dart';

import '../Admin/AdminScreens/main_category/main_category_view_model.dart';
import '../utilities/margins/margins.dart';
import 'widgets.dart';

class MainCategoryList extends StatefulWidget {
  final MainCategoryViewModel? viewModel;

  const MainCategoryList({
    Key? key,
    this.viewModel,
  }) : super(key: key);

  @override
  State<MainCategoryList> createState() => _MainCategoryListState();
}

class _MainCategoryListState extends State<MainCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.viewModel!.qSnapshot == null
            ? const Text("Loading..")
            : Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 8),
                child: Row(
                  children: [
                    DropdownButton(
                      value: widget.viewModel!.selVal,
                      hint: Text(
                        'Select Category',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: VendiColors.masterColor,
                                fontSize: 17.sp),
                      ),
                      items: widget.viewModel!.qSnapshot!.docs.map((e) {
                        return DropdownMenuItem<String>(
                          value: e['catName'],
                          child: Text(e['catName']),
                        );
                      }).toList(),
                      onChanged: (val) {
                        widget.viewModel!.setSelVal(val);
                      },
                    ),
                    XMargin(20.w),
                    VButton(
                      onPressed: () {
                        widget.viewModel!.setSelVal(null);
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
              ),
        StreamBuilder<QuerySnapshot>(
            stream: widget.viewModel?.firebaseService.mainCat
                .where('category', isEqualTo: widget.viewModel?.selVal)
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
