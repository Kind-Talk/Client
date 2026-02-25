import 'package:front_end/features/home/utils/index.dart';
import 'package:flutter/cupertino.dart';

// ======== STATELESS WIDGETS ========
// 선생 홈 - 헤더
class TeacherHomeHeader extends StatelessWidget {
  const TeacherHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133.h,
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