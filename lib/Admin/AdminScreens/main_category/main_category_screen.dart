import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../utilities/constants/constants.dart';
import '../../../utilities/margins/margins.dart';
import '../../../utilities/value_validators.dart';
import '../../../widgets/widgets.dart';
import 'main_category_view_model.dart';

class MainCategoryscreen extends StatefulWidget {
  static const String id = "Main-Category";

  const MainCategoryscreen({super.key});

  @override
  State<MainCategoryscreen> createState() => _MainCategoryscreenState();
}

class _MainCategoryscreenState extends State<MainCategoryscreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainCategoryViewModel>.reactive(
        viewModelBuilder: () => MainCategoryViewModel(),
        onViewModelReady: (mc) {
          mc.setInitialised(true);
          mc.getCatList();
        },
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'MainCategory',
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: model.mformKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        model.qSnapshot == null
                            ? const Text("Loading...")
                            : const MainCatDropDown(
                                // viewModel: model,
                                ),
                        YMargin(8.h),
                        model.noCatSelected == true
                            ? Text(
                                'No Category Selected',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Colors.red,
                                    ),
                              )
                            : Container(),
                        SizedBox(
                          width: 210.w,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                              }else if (model.mformKey.currentState!.validate()) {
                                model.uploadTask();
                              } else {
                                AutovalidateMode.onUserInteraction;
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
                  ),
                ),
                Divider(thickness: 1.h, color: VendiColors.masterColor),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Main Category List',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                MainCategoryList(
                  viewModel: model,
                ),
              ],
            ),
          );
        });
  }
}
