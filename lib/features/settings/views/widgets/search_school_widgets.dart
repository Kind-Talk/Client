import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showSchoolSearchTab(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: const Color(0x33111111),
    builder: (_) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const SearchSchoolTab(),
    ),
  );
}

class SearchSchoolTab extends StatelessWidget {
  const SearchSchoolTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 27.h,
                  child: Text(
                    "학교 이름을 검색하세요",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),

                SizedBox(height: 12.h),
                
                SizedBox(
                  height: 24.h,
                  child: Text(
                    "ex) 유현초",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF848484),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          SizedBox(
            width: 302.w,
            height: 50.h,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide: BorderSide.none,
                ),

                filled: true,
                fillColor: Color(0xF3F3F5FF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}