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
                  itemCount: model.bannerImage.length,
                  itemBuilder: (context, index) {
                    String ban = model.bannerImage[index];
                    return Image.network(ban,fit:BoxFit.cover);
                  },
                  onPageChanged: (val) {
                    model.setBannerScroller(val.toDouble());
                  },
                  position: model.bannerScrollPosition,
                ),
                BrandHighLights(
                  onPageChanged: (val) {
                    model.setBrandScroller(val.toDouble());
                  },
                  position: model.brandScrollPosition,
                ),
                CategoryWidget()
              ],
            ),
          );
        });
  }
}
