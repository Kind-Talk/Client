import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// 자녀 정보 수정 - 헤더
class EditStudentInfoHeader extends StatelessWidget {
  final String studentName;

  const EditStudentInfoHeader({
    super.key,
    required this.studentName,
  });

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

              Text(
                '$studentName 학생 정보',
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

// 자녀 정보 수정 - 정보
class EditStudentInfoInfo extends StatelessWidget {
  final String studentName;
  final int birthYear = 2020;     // 추후 변경 예정
  final int birthMonth = 1;       // 추후 변경 예정
  final int birthDay = 1;         // 추후 변경 예정
  final String schoolName;
  final int grade;
  final String section = '0'; // 1, 2, ..반이 아닌 다른 형태의 반도 반영하기 위해
                              // 예) 솔, 은, 참, 향, 단 <- 제 초등학교였음...

  const EditStudentInfoInfo({
    super.key,
    required this.studentName,
    required this.schoolName,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 108.h,
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

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          SizedBox(
            width: 320.w,
            height: 40.h,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                      studentName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Text(
                  "$birthYear년 $birthMonth월 $birthDay일",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          Text(
            "$schoolName초등학교 $grade학년 $section반",
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

// 저장하기 버튼
class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.w),
        onTap: () {},
        child: Ink(
          width: 360.w,
          padding: EdgeInsets.all(16.w),

          decoration: BoxDecoration(
            color: Color(0xFFE0ECE4),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),

          child: Center(
            child: Text(
              "저장하기",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0A0A0A),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
