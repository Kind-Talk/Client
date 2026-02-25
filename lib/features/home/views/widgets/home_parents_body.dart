import 'package:front_end/features/home/utils/index.dart';
import 'package:flutter/cupertino.dart';

class ParentsHomeBody extends StatelessWidget {
  const ParentsHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopArea(),

          SizedBox(height: 16.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 자녀 이름
                Text(
                  '홍시아 자녀',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2F7D4E),
                  ),
                ),

                SizedBox(height: 16.h),

                // 채팅 카드
                ChatCard(),

                SizedBox(height: 16.h),

                // 선생님 리스트 타이틀
                Text(
                  '선생님 리스트',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 16.h),

                // 선생님 리스트
                Column(
                  children: [
                    TeacherCard(
                      name: "김영희 선생님",
                      studentCount: 20,
                      schoolInfo: "000 초등학교 0학년 0반",
                      statusMessage: "질문이 있으시면 언제든 물어보세요",
                      unreadCount: 2,
                      lastQuestion: "선생님 ~ 이번주 숙제 알 수 있을까요?",
                      time: "1시간 전",
                      unreadColor: 0xFF2F7D4E,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatRoomScreen(
                              teacherName: "김영희 선생님",
                              schoolName: "000 초등학교",
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    TeacherCard(
                      name: "김영희 선생님",
                      studentCount: 20,
                      schoolInfo: "000 초등학교 0학년 0반",
                      statusMessage: "질문이 있으시면 언제든 물어보세요",
                      unreadCount: 2,
                      lastQuestion: "선생님 ~ 이번주 숙제 알 수 있을까요?",
                      time: "1시간 전",
                      unreadColor: 0xFF2F7D4E,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatRoomScreen(
                              teacherName: "김영희 선생님",
                              schoolName: "000 초등학교",
                            ),
                          ),
                        );
                      },
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
