import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/chat/utils/index.dart';
import 'package:front_end/features/chat/widgets/chat_teacher_widgets.dart';

class TeacherChatroomScreen extends StatefulWidget {
  final int schoolYear;       // 학년도
  final int grade;            // 학년
  final String session;       // 반
  final String classroomCode; // 채팅방 코드
  final bool isTeacherMode;

  const TeacherChatroomScreen({
    super.key,
    required this.schoolYear,
    required this.grade,
    required this.session,
    required this.classroomCode,
    required this.isTeacherMode,
  });

  @override
  State<TeacherChatroomScreen> createState() => _TeacherChatroomScreenState();
}

class _TeacherChatroomScreenState extends State<TeacherChatroomScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFE9F4ED),

      // 상단 바
      appBar: TeacherChatroomAppBar(
        schoolYear: widget.schoolYear,
        grade: widget.grade,
        session: widget.session,
        classroomCode: widget.classroomCode
      ),

      // 채팅 내용
      body: Column(
        children: [
          TopicSection(isTeacherMode: widget.isTeacherMode),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                SizedBox(height: 20.h),

                // 날짜 구분선
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      "2024년 12월 29일",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // 채팅 메시지들 (더미 데이터)
                MessageBubble(
                  sender: "김철수 학부모",
                  text: "선생님~ 수업 진행 방식 알 수 있을까요?",
                  time: "오전 9:30",
                  isMe: false,
                  bubbleColor: const Color(0xFF2F7D4E),
                  textColor: Colors.white,
                ),

                MessageBubble(
                  sender: null,
                  text: "안녕하세요, 다음 주 월요일 수업은 온라인으로 진행됩니다.",
                  time: "오전 10:15",
                  isMe: true,
                  bubbleColor: const Color(0xFFB0D0C4),
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),

      // 하단 입력창
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: InputArea(
          controller: _controller,
          onSendPressed: () {
            if (kDebugMode) print("전송 버튼 눌림");
            _controller.clear();
          },
        ),
      ),
    );
  }
}
