import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/utilities/margins/margins.dart';

import '../../../utilities/constants/constants.dart';
import '../../../widgets/widgets.dart';
import 'category_view_model.dart';

class Categoryscreen extends StatefulWidget {
  static const String id = "category";

  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
        viewModelBuilder: () => CategoryViewModel(),
        onModelReady: (ca) {
          ca.setInitialised(true);
        },
        builder: (context, model, child) {
          return Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26.sp,
                  ),
                ),
              ),
              Divider(thickness: 1.h, color: VendiColors.masterColor),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: model.getImage,
                          child: Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: VendiColors.exColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: VendiColors.exColor.withOpacity(0.8)),
                            ),
                            child: Center(
                              child: model.avatarImageFile == null
                                  ? Text(
                                      "Category Image",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(),
                                    )
                                  : Image.file(model.avatarImageFile!,fit:BoxFit.cover),
                            ),
                          ),
                        ),
                        YMargin(10.h),
                        VButton(
                          color: VendiColors.masterColor,
                          padding: const EdgeInsets.all(4),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 38.h,
                          onPressed: model.getImage,
                          child: Text(
                            'Upload Image',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: VendiColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    XMargin(10.w),
                    Column(children: [
                      SizedBox(
                        width: 180.w,
                        child: const TextField(
                          decoration: InputDecoration(
                            label: Text('Enter Category Name'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      YMargin(10.h),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                  color: VendiColors.masterColor,
                                )),
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: 35.h,
                            color: VendiColors.primaryColorswatch[100],
                            child: Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: VendiColors.masterColor),
                            ),
                          ),
                          XMargin(40.w),
                          VButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                  color: VendiColors.masterColor,
                                )),
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: 35.h,
                            color: VendiColors.masterColor,
                            child: Text(
                              'Save',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: VendiColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              Divider(thickness: 1.h, color: VendiColors.masterColor),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Category List',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
