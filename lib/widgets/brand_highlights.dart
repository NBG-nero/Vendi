import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';

import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/margins/margins.dart';
import 'package:vendi/widgets/dots_indicator_widget.dart';

import '../screens/home/home_view_model.dart';

class BrandHighLights extends StatefulWidget {
  final double? position;
  final void Function(int)? onPageChanged;
  final HomeViewModel? viewModel;
  const BrandHighLights({
    Key? key,
    this.position,
    this.onPageChanged,
    this.viewModel,
  }) : super(key: key);

  @override
  State<BrandHighLights> createState() => _BrandHighLightsState();
}

class _BrandHighLightsState extends State<BrandHighLights> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            YMargin(18.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Brand Highlights",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20.sp)),
              ),
            ),
            Container(
              height: 170.h,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: PageView.builder(
                itemCount: widget.viewModel!.brandAds.length,
                itemBuilder: (context, index) {
                  String image1 = widget.viewModel!.brandAds[index]['image1'];
                  return Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                  height: 100.h,
                                  color: VendiColors.tertiaryColor,
                                  child: Center(
                                    child: Text(
                                      "Youtube ad Video\nAbout Brand ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      height: 50.h,
                                      color: Colors.red,
                                      child: Center(
                                        child:CachedNetworkImage( 
                                          imageUrl:image1,
                                          placeholder: (context, url) => GFShimmer(child:Container()) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 4, 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      height: 50.h,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          "Ad",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                height: 160.h,
                                color: Colors.blueAccent,
                                child: Center(
                                  child: Text(
                                    "Ad",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  );
                },
                onPageChanged: (val) {
                  widget.viewModel!.setBrandScroller(val.toDouble());
                },
              ),
            ),
            DotsIndicatorWidget(position: widget.viewModel!.brandScrollPosition)
          ],
        ));
  }
}
