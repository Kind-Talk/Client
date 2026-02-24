import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
