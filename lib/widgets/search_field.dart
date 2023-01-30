import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
