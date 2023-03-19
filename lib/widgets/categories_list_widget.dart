import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vendi/Admin/AdminScreens/category/category_view_model.dart';
import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/utils.dart';

class CategoryListWidget extends StatelessWidget {
  final CategoryViewModel? viewModel;

  const CategoryListWidget({
    Key? key,
    this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: viewModel?.firebaseService.categories.snapshots(),
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
                crossAxisCount: 4, crossAxisSpacing: 3.w, mainAxisSpacing: 3.h),
            itemCount: snapshot.data!.size,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return Card(
                  color: VendiColors.masterColor.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          data["image"],
                          fit: BoxFit.scaleDown,
                          height: 50.h,
                          width: 50.w,
                        ),
                        SizedBox(
                          height: 30.h,
                          child: Text(
                            data['catName'],
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    overflow: data['catName']
                                                .toString()
                                                .characters
                                                .length >
                                            22
                                        ? TextOverflow.ellipsis
                                        : TextOverflow.visible),
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          );
        });
  }
}
