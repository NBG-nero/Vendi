import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vendi/Admin/AdminScreens/category/category_view_model.dart';
import 'package:vendi/Admin/AdminScreens/sub_category/sub_cat_view_model.dart';
import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/utils.dart';
import 'package:vendi/widgets/widgets.dart';

import '../utilities/margins/margins.dart';

class CategoryListWidget extends StatelessWidget {
  final CollectionReference? reference;
  final CategoryViewModel? viewModel;
  final SubCategoryViewModel? subViewModel;

  const CategoryListWidget({
    Key? key,
    this.reference,
    this.viewModel,
    this.subViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (reference == subViewModel?.firebaseService.subCat &&
            subViewModel?.subSnapshot != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8, left: 8),
            child: Row(
              children: [
                DropdownButton(
                  value: subViewModel!.catSelectedVal,
                  hint: Text(
                    'Select Main Category',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: VendiColors.masterColor, fontSize: 17.sp),
                  ),
                  items: subViewModel!.subSnapshot!.docs.map((e) {
                    return DropdownMenuItem<String>(
                      value: e['mainCategory'],
                      child: Text(e['mainCategory']),
                    );
                  }).toList(),
                  onChanged: (val) {
                    subViewModel!.setCatSelected(val);
                  },
                ),
                XMargin(20.w),
                VButton(
                  onPressed: () {
                    subViewModel!.setCatSelected(null);
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
            stream: reference!
                .where('mainCategory', isEqualTo: subViewModel?.catSelectedVal)
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
                showErrorToast("No Categories Added");

                return const Text('No categories Added');
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3.w,
                    mainAxisSpacing: 3.h),
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  String imageUrl = data["image"];
                  String imageText =
                      (reference == viewModel!.firebaseService.categories
                          ? data["catName"]
                          : data["subCatName"]);
                  return Card(
                      elevation:
                          reference == viewModel!.firebaseService.categories
                              ? 0
                              : 10,
                      color: reference == viewModel!.firebaseService.categories
                          ? VendiColors.masterColor.withOpacity(0.3)
                          : VendiColors.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 70.h,
                              width: reference ==
                                      viewModel!.firebaseService.categories
                                  ? 70.w
                                  : 90.w,
                              child: CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => SizedBox(
                                        height: 50.h,
                                        child: Center(
                                          child: CircularProgressIndicator
                                              .adaptive(
                                                  backgroundColor:
                                                      VendiColors.masterColor),
                                        ),
                                      )),
                            ),
                            SizedBox(
                              height: 40.h,
                              child: Center(
                                child: Text(
                                  imageText,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          overflow:
                                              imageText.characters.length > 24
                                                  ? TextOverflow.ellipsis
                                                  : TextOverflow.visible),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
            }),
      ],
    );
  }
}
