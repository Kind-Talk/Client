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
                ChatCard(),

                SizedBox(height: 16.h),

                // 채팅방 리스트 타이틀
                Text(
                  '개설된 채팅방 리스트',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 16.h),

                // 방 리스트
                Column(
                  children: [
                    ClassroomCard(),
                    SizedBox(height: 16.h),
                    ClassroomCard(),
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
