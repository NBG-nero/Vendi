// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';

import '../screens/home/home_view_model.dart';
// import '../utilities/locator.dart';
import 'dots_indicator_widget.dart';

class BannerWidget extends StatefulWidget {
  final double? position;
  final void Function(int)? onPageChanged;

  final HomeViewModel? viewModel;
  const BannerWidget({
    Key? key,
    this.position,
    this.onPageChanged,
    this.viewModel,
  }) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: widget.viewModel!.bannerImage.isEmpty
                ? GFShimmer(
                    showShimmerEffect: true,
                    mainColor: Colors.grey.shade400,
                    secondaryColor: Colors.grey.shade300,
                    child: Container(
                      height: 140.h,
                      color: Colors.grey.shade200,
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                : Container(
                    height: 140.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade100,
                    child: PageView.builder(
                      itemCount: widget.viewModel!.bannerImage.length,
                      itemBuilder: (context, index) {
                        String ban = widget.viewModel!.bannerImage[index];
                        return Image.network(ban, fit: BoxFit.cover);
                      },
                      onPageChanged: widget.onPageChanged,
                    )),
          ),
        ),
        Positioned(
            bottom: 11.h,
            child: DotsIndicatorWidget(position: widget.position)),
      ],
    );
  }
}
