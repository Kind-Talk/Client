import 'package:front_end/features/home/utils/index.dart';
import 'package:flutter/cupertino.dart';

// ======== STATELESS WIDGETS ========
// 선생 홈 - 헤더
class TeacherHomeHeader extends StatelessWidget {
  const TeacherHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133.h,

      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "수업 채팅방",
                style: TextStyle(
                  color: Color(0xFF2A7146),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ), 
              Text("icon"),
            ],
          ),

          Text("채팅방 검색"),
        ],
      ),
    );
  }
}

// 학급 단체방 카드
class ClassroomCard extends StatelessWidget {
  const ClassroomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362.w,
      height: 156.h,
      padding: EdgeInsets.all(21.w),

      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2025학년 1-2반",
                style: TextStyle(
                  color: Color(0xFF0A0A0A),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ), 
              Text("Notif")
            ],
          ),

          Text(
            "채팅방 코드: 6DK4D1",
            style: TextStyle(
              color: Color(0xFF717182),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),

          Text("--------"),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Icon"), 
                  Text(
                    "최근 질문",
                    style: TextStyle(
                      color: Color(0xFF717182),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ), 
              
              Text(
                "어제",
                style: TextStyle(
                  color: Color(0xFF717182),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          Text(
            "선생님 ~ 이번주 숙제 알 수 있을까요?",
            style: TextStyle(
              color: Color(0xFF4A5565),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}