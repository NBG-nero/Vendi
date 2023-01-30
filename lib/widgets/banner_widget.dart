import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dots_indicator_widget.dart';

class BannerWidget extends StatelessWidget {
  final double? position;
  final void Function(int)? onPageChanged;
  const BannerWidget({
    Key? key,
    this.position,
    this.onPageChanged,
  }) : super(key: key);

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
                child: PageView(
                  onPageChanged: onPageChanged,
                  children: const [
                    Center(child: Text("Banner 1")),
                    Center(child: Text("Banner 2")),
                    Center(child: Text("Banner 3")),
                  ],
                )),
          ),
        ),
        Positioned(
            bottom: 11.h, child: DotsIndicatorWidget(position: position)),
      ],
    );
  }
}
