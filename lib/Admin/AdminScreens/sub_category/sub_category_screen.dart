import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/Admin/AdminScreens/sub_category/sub_cat_view_model.dart';

import '../../../utilities/constants/constants.dart';
import '../../../utilities/margins/margins.dart';
import '../../../utilities/value_validators.dart';
import '../../../widgets/widgets.dart';

class SubCategoryscreen extends StatelessWidget {
  static const String id = "Sub-Category";

  const SubCategoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubCategoryViewModel>.reactive(
        viewModelBuilder: () => SubCategoryViewModel(),
        onModelReady: (sa) {
          sa.setInitialised(true);
        },
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'SubCategory',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  Divider(thickness: 1.h, color: VendiColors.masterColor),
                  Row(
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
                                      child: Image.file(model.avatarImageFile!,
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
                      XMargin(5.w),
                      Column(
                        children: [
                          model.qSnapshot == null
                              ? const Text("Loading...")
                              : SubCatDropDown(
                                  viewModel: model,
                                ),
                          YMargin(8.h),
                          if (model.noCatSelected == true)
                            Text(
                              'No Category Selected',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                          SizedBox(
                            width: 210.w,
                            child: TextFormField(
                              validator: (val) =>
                                  ValueValidator().validateMainCat(val!),
                              controller: model.mainCatNameCtrl,
                              decoration: InputDecoration(
                                label: Text('Enter Main Category Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                            color: VendiColors.masterColor,
                                            fontSize: 17.sp)),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          YMargin(20.h),
                          Row(children: [
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
                                    ?.copyWith(color: VendiColors.masterColor),
                              ),
                            ),
                            XMargin(40.w),
                            VButton(
                              onPressed: () {
                                if (model.selectedValue == null) {
                                  model.setnoCatselected(true);
                                  return;
                                }
                                if (model.mformKey.currentState!.validate()) {
                                  model.uploadTask();
                                }
                              },
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
                          ]),
                        ],
                      ),
                    ],
                  ),
                  Divider(thickness: 1.h, color: VendiColors.masterColor),
                ],
              ),
            ),
          );
        });
  }
}
