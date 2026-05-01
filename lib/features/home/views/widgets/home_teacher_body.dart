import 'package:front_end/features/chat/views/chat_teacher_screen.dart';
import 'package:front_end/features/home/utils/index.dart';
import 'package:front_end/features/home/views/widgets/home_teacher_widgets.dart';

class TeacherHomeBody extends StatelessWidget {
  final bool isTeacherMode;
  const TeacherHomeBody({super.key, required this.isTeacherMode});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 화면 영역 정의 - 채팅방 생성 버튼 위치를 지정하기 위한 기준 역할
        SizedBox(width: double.infinity, height: double.infinity),

        // 학급 채팅방 리스트
        SingleChildScrollView(
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
                    ChatCard(backgColor: 0xFFF8E9A6, fontColor: 0xFF26643E),

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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherChatroomScreen(
                                  schoolYear: 2025,
                                  grade: 1,
                                  session: '2',
                                  classroomCode: '6DK4D1',
                                  isTeacherMode: isTeacherMode,
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 16.h),

                        ClassroomCard(
                          schoolYear: 2024,
                          grade: 1,
                          section: '1',
                          chatroomCode: '47JP4K',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherChatroomScreen(
                                  schoolYear: 2024,
                                  grade: 1,
                                  session: '1',
                                  classroomCode: '47JP4K',
                                  isTeacherMode: isTeacherMode,
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 16.h),

                        ClassroomCard(
                          schoolYear: 2023,
                          grade: 2,
                          section: '3',
                          chatroomCode: '2W87AM',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherChatroomScreen(
                                  schoolYear: 2023,
                                  grade: 2,
                                  session: '3',
                                  classroomCode: '2W87AM',
                                  isTeacherMode: isTeacherMode,
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 16.h),

                        ClassroomCard(
                          schoolYear: 2022,
                          grade: 1,
                          section: '1',
                          chatroomCode: 'N72R3H',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherChatroomScreen(
                                  schoolYear: 2022,
                                  grade: 1,
                                  session: '1',
                                  classroomCode: 'N72R3H',
                                  isTeacherMode: isTeacherMode,
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
        ),

        // 채팅방 생성 버튼
        Positioned(
          right: 16.w,
          bottom: 16.h,
          child: CreateNewClassChatButton(),
        ),
      ],
    );
  }
}
