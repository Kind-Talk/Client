import 'package:front_end/features/home/utils/index.dart';
import 'package:flutter/cupertino.dart';

import 'package:front_end/features/home/views/widgets/home_teacher_widgets.dart';

class TeacherHomeBody extends StatelessWidget {
  const TeacherHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TeacherHomeHeader(),

          SizedBox(height: 16.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 채팅 카드
                ChatCard(backgColor: 0xFFF8E9A6, fontColor: 0xFF26643E,),

                SizedBox(height: 16.h),

                // 채팅방 리스트 타이틀
                Text(
                  '개설된 채팅방 리스트',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 16.h),

                // 방 리스트
                Column(
                  children: [
                    ClassroomCard(
                      schoolYear: 2025,
                      grade: 1,
                      section: '2',
                      chatroomCode: '6DK4D1',
                    ),
                    SizedBox(height: 16.h),
                    ClassroomCard(
                      schoolYear: 2024,
                      grade: 1,
                      section: '1',
                      chatroomCode: '47JP4K',
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
