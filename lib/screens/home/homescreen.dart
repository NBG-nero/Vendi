import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stacked/stacked.dart';
import 'package:vendi/utilities/margins/margins.dart';

import '../../utilities/constants/constants.dart';
import '../../widgets/widgets.dart';
import 'home_view_model.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (h) {
          h.setInitialised(true);
          h.getBanners();
          h.getBrandAd();
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: VendiColors.primaryColor,
            appBar: vendiAppBar(
                context: context,
                // backgroundColor: VendiColors.primaryColor,
                // elevation: 0,
                title: Text(
                  "VENDI",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.shopping_cart, size: 26.h))
                ]),
            body: ListView(
              children: [
                const SearchWidget(),
                YMargin(10.h),
                BannerWidget(
                  viewModel: model,
                ),
                BrandHighLights(
                  viewModel: model,
                ),
                CategoryWidget(
                  viewModel: model,
                ),
                Center(
                  child: VButton(
                    onPressed: () {
                      model.signout(context);
                    },
                    buttontext: 'Sign Out',
                  ),
                )
              ],
            ),
          );
        });
  }
}
