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
            children: [
              Text("수업 채팅방"), 
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

      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),

      child: Column(
        children: [
          Row(children: [Text("2025학년 1-2반"), Text("Notif")],),

          Text("체팅방 코드: 6DK4D1"),

          Text("--------"),

          Row(children: [Row(children: [Text("Icon"), Text("최근 질문"),],), Text("어제"),],),

          Text("선생님 ~ 이번주 숙제 알 수 있을까요?"),
        ],
      ),
    );
  }
}