import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end/features/settings/views/edit_student_info_screen.dart';

// ======== STATELESS WIDGETS ========
// 자녀 정보 확인 헤더
class StudentInfoHeader extends StatelessWidget {
  const StudentInfoHeader({super.key});

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
                '자녀 정보 확인',
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

// 자녀 정보 확인 정보 탭
class StudentInfoInfoTab extends StatelessWidget {
  const StudentInfoInfoTab({super.key});

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
            "자녀 정보 입력",
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

// 학생 정보 카드 탭
class StudentInfoCard extends StatelessWidget {
  final String studentName;
  final String schoolName = "00"; // 추후 변경 예정
  final int grade = 0;            // 추후 변경 예정

  const StudentInfoCard({
    super.key,
    required this.studentName
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => EditStudentInfoScreen(
                studentName: studentName, 
                schoolName: schoolName,
                grade: grade
              ),
            )
          );
        },
        child: Ink(
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

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentName,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),

                  SizedBox(height: 8.h,),

                  Text(
                    "$schoolName초등학교 $grade학년",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                ],
              ),

              SvgPicture.asset('assets/icons/arrow_gray.svg', width: 20.h, height: 20.h)
            ],
          ),
        )
      ),
    );
  }
}