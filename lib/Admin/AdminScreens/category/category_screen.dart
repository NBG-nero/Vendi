import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/utilities/margins/margins.dart';

import '../../../utilities/constants/constants.dart';
import '../../../utilities/value_validators.dart';
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
          // ca.dispose();
        },
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
                Divider(thickness: 1.h, color: VendiColors.masterColor),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: model.formKey,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: model.pickImage,
                              child: Container(
                                height: 150.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                  color: VendiColors.exColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color:
                                          VendiColors.exColor.withOpacity(0.8)),
                                ),
                                child: model.avatarImageFile == null
                                    ? Center(
                                        child: Text(
                                          "Category Image",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.file(
                                            model.avatarImageFile!,
                                            fit: BoxFit.cover),
                                      ),
                              ),
                            ),
                            YMargin(10.h),
                            VButton(
                              color: VendiColors.masterColor,
                              padding: const EdgeInsets.all(4),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 38.h,
                              onPressed: model.pickImage,
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
                            child: TextFormField(
                              validator: (val) =>
                                  ValueValidator().validateCat(val!),
                              controller: model.catNameCtrl,
                              decoration: const InputDecoration(
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
                                onPressed: () {
                                  model.clear();
                                },
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
                                      ?.copyWith(
                                          color: VendiColors.masterColor),
                                ),
                              ),
                              XMargin(40.w),
                              model.avatarImageFile == null
                                  ? Container()
                                  : VButton(
                                      onPressed: () {
                                        if (model.formKey.currentState!
                                            .validate()) {
                                          model.uploadImage();
                                        }
                                      },
                                      padding: const EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: VendiColors.masterColor,
                                          )),
                                      width: MediaQuery.of(context).size.width *
                                          0.14,
                                      height: 35.h,
                                      color: VendiColors.masterColor,
                                      child: Text(
                                        'Save',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                color:
                                                    VendiColors.primaryColor),
                                      ),
                                    ),
                            ],
                          ),
                        ]),
                      ],
                    ),
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
                YMargin(10.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryListWidget(
                    viewModel: model,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
