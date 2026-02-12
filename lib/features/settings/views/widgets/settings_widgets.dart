import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 개인 설정 변경
class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

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

      child: Row(
        children: [
          Column(
            children: [
              Text('홍길동'),

              Text('오늘도 좋은 하루 되세요!')
            ],
          ),

          Text('Setting Icon'),
        ],
      )
    );
  }
}

// 학교 설정 변경
class SchoolInfo extends StatelessWidget {
  const SchoolInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21.w),

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
          Text('Person Icon'),

          Column(
            children: [
              Text('학교 정보 변경'),

              Text('학교, 학급 등')
            ],
          ),
        ],
      )
    );
  }
}

// 로그아웃
class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21.w),

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
          Text('Person Icon'),

          Text('로그아웃'),
        ],
      )
    );
  }
}