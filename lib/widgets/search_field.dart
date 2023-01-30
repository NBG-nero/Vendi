import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendi/utilities/constants/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 8, 10.h),
                    prefixIcon: Icon(Icons.search, size: 25.sp),
                    hintText: 'Search on Vendi',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.sp,
                        fontStyle: FontStyle.italic)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 28.h,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
               Icon(IconlyBold.infoSquare,
                      size: 14.h,
                      color: VendiColors.masterColor.withOpacity(0.8)),
                  Text(
                    ' 100% Genuine',
                 style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: VendiColors.masterColor.withOpacity(0.8),
                        fontSize: 13.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(IconlyBold.infoSquare,
                      size: 14.h,
                      color: VendiColors.masterColor.withOpacity(0.8)),
                  Text(
                    ' 4 - 7 Days Return',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: VendiColors.masterColor.withOpacity(0.8),
                        fontSize: 13.sp),
                  ),
                ],
              ),
              Row(
                children: [
                 Icon(IconlyBold.infoSquare,
                      size: 14.h,
                      color: VendiColors.masterColor.withOpacity(0.8)),
                  Text(
                    ' Trusted Brands',
                   style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: VendiColors.masterColor.withOpacity(0.8),
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
