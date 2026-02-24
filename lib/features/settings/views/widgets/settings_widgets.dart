import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_end/features/settings/views/add_student_screen.dart';
import 'package:front_end/features/settings/views/personal_info_screen.dart';
import 'package:front_end/features/settings/views/school_info_screen.dart';
import 'package:front_end/features/settings/views/student_info_screen.dart';

// ======== STATEFUL WIDGETS ========
// 교사-학부모 전환 스위치
class RoleToggleButton extends StatefulWidget {
  const RoleToggleButton({super.key});

  @override
  State<RoleToggleButton> createState() => _RoleToggleButtonState();
}

class _RoleToggleButtonState extends State<RoleToggleButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.all(16.w),
      alignment: Alignment.centerRight,

      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            // 모드 변경 안내 텍스트
            Text(
              '${isSwitched? '교사' : '학부모'} 모드 변경',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(width: 10.w),
            
            // 교사-학부모 전환 스위치
            Container(
              child: CupertinoSwitch(
                value: isSwitched, 
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                ///// 임시 색 부여 ////////
                // Teacher mode
                activeTrackColor: Colors.blueAccent,
                // Parents mode
                inactiveTrackColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======== STATELESS WIDGETS ========
// ------ COMMON ------
// 설정 헤더
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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

      child: Text(
        '설정',
        style: TextStyle(
          fontSize: 16.h,
          fontWeight: FontWeight.w400,
          color: Color(0xFF1C4B2F),
        ),
      ),
    );
  }
}

// 개인 설정 변경
class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PersonalInfoScreen()
          ),
        );
      },
      child: Container(
        width: 360.w,
        padding: EdgeInsets.all(21.w),

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

        child: Container(
          width: 320.w,
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 225.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '홍길동',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0A0A0A),
                      ),
                    ),

                    Text(
                      '오늘도 좋은 하루 되세요!',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF717182),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 64.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/icons/settings.svg', width: 20, height: 20),

                    SvgPicture.asset('assets/icons/arrow_green.svg', width: 20, height: 20),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

// 로그아웃
class SignOut extends StatelessWidget {
  const SignOut({super.key});

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

      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),

            decoration: BoxDecoration(
              color: Color(0xFFFFE2E2),
              shape: BoxShape.circle,
            ),

            child: SvgPicture.asset('assets/icons/sign_out.svg', width: 20, height: 20),
          ),

          SizedBox(width: 16.h),

          Expanded(
            child: Container(
              child: Text(
                '로그아웃',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFE7000B),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

// 버전 표시
class Versions extends StatelessWidget {
  const Versions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: Text(
        '버전 1.0.0',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFF717182)
        ),
      ),
    );
  }
}

// ------ TEACHER ------
// 학교 설정 변경
class SchoolInfo extends StatelessWidget {
  const SchoolInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SchoolInfoScreen(),
          ),
        );
      },

      child: Container(
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
          children: [
            Container(
              padding: EdgeInsets.all(8.w),

              decoration: BoxDecoration(
                color: Color(0xFFF3F4F6),
                shape: BoxShape.circle,
              ),

              child: SvgPicture.asset('assets/icons/personal.svg', width: 20, height: 20),
            ),

            SizedBox(width: 16.h),

            Container(
              width: 240.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '학교 정보 변경',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),

                  Text(
                    '학교, 학급 등',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF717182),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(width: 16.h),

            SvgPicture.asset('assets/icons/arrow_gray.svg', width: 20, height: 20),
          ],
        )
      ),
    );
  }
}

// ------ PARENT ------
// 자녀 추가
class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddStudentScreen(),
          ),
        );
      },

      child: Container(
        width: 360.w,
        padding: EdgeInsets.all(16.w),

        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r)
            ),
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
              padding: EdgeInsets.all(8.w),

              decoration: BoxDecoration(
                color: Color(0xFFF3F4F6),
                shape: BoxShape.circle,
              ),

              child: SvgPicture.asset('assets/icons/personal.svg', width: 20, height: 20),
            ),

            SizedBox(width: 16.h),

            Container(
              width: 240.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '자녀 추가',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),

                  Text(
                    '새로운 자녀 추가',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF717182),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(width: 16.h),

            SvgPicture.asset('assets/icons/arrow_gray.svg', width: 20, height: 20),
          ],
        )
      ),
    );
  }
}

// 자녀 정보 확인
class StudentInfo extends StatelessWidget {
  const StudentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StudentInfoScreen(),
          ),
        );
      },

      child: Container(
        width: 360.w,
        padding: EdgeInsets.all(16.w),

        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r)
            ),
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
              padding: EdgeInsets.all(8.w),

              decoration: BoxDecoration(
                color: Color(0xFFF3F4F6),
                shape: BoxShape.circle,
              ),

              child: SvgPicture.asset('assets/icons/personal.svg', width: 20, height: 20),
            ),

            SizedBox(width: 16.h),

            SizedBox(
              width: 240.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '자녀 정보 확인',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),

                  Text(
                    '자녀 정보 관리',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF717182),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(width: 16.h),

            SvgPicture.asset('assets/icons/arrow_gray.svg', width: 20, height: 20),
          ],
        )
      )
    );
  }
}