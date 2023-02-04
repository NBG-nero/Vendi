import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/home/home_view_model.dart';
import '../utilities/locator.dart';
import 'dots_indicator_widget.dart';

class BannerWidget extends StatefulWidget {
  final double? position;
  final void Function(int)? onPageChanged;
  const BannerWidget({
    Key? key,
    this.position,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final lo = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: PageView.builder(
                  itemCount: lo.bannerImage.length,
                  itemBuilder: (context, index) {
                    String ban = lo.bannerImage[index];
                    return Image.network(ban);
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
