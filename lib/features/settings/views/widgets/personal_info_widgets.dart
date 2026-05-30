import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/common/models/member.dart';

// ======== STATELESS WIDGETS ========
// 개인 정보 확인 - 헤더
class PersonalInfoHeader extends StatelessWidget {
  const PersonalInfoHeader({super.key});

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
                '개인 정보 확인',
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

// 개인 정보 확인 - 정보 탭 (이메일, 역할 표시)
class PersonalInfoInfoTab extends StatelessWidget {
  final String email;
  final Role role;

  const PersonalInfoInfoTab({
    super.key,
    required this.email,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
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
            width: 40.h,
            height: 40.h,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: SvgPicture.asset('assets/icons/personal_white.svg', width: 24.h, height: 24.h),
          ),

          SizedBox(width: 12.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                email,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                role == Role.teacher ? '선생님' : '학부모',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1C4B2F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 개인 정보 텍스트 입력 필드 (이름/닉네임 공용)
class PersonalInfoTextField extends StatelessWidget {
  final String label;
  final String iconPath;
  final TextEditingController controller;
  final String hintText;

  const PersonalInfoTextField({
    super.key,
    required this.label,
    required this.iconPath,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20.h,
                height: 20.h,
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(),
                child: SvgPicture.asset(iconPath, width: 16.h, height: 16.h),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          SizedBox(
            width: 320.w,
            height: 36.h,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFF3F3F5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
