import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ======== STATELESS WIDGETS ========
// 학교 정보 변경 - 헤더
class SchoolInfoHeader extends StatelessWidget {
  const SchoolInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Ink(
          width: double.infinity,
          height: 56.h,
          padding: EdgeInsets.all(16.h),

          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: Row(
            children: [
              SvgPicture.asset('assets/icons/back_arrow.svg', width: 24.h, height: 24.h),

              SizedBox(width: 8.w,),

              Text(
                '학교 정보 변경',
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1C4B2F),
                ),
              ),
            ],
          ),
        ), 
      ),
    );
  }
}

// 하교 정보 변경 - 정보
class SchoolInfoInfoTab extends StatelessWidget {
  const SchoolInfoInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 80.h,
      padding: EdgeInsets.all(20.w),

      decoration: BoxDecoration(
        color: Color(0xFFBFD7C8),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 40.h, // Same value with height => to make it perfect square
            height: 40.h,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(16.r),
            ),

            child: SvgPicture.asset('assets/icons/personal_white.svg', width: 24.h, height: 24.h),
          ),

          SizedBox(width: 12.w,),

          Text(
            "학교 정보 확인",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
