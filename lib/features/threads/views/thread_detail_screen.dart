import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/threads/utils/index.dart';

class ThreadDetailScreen extends StatefulWidget {
  final String category;
  final String question;

  const ThreadDetailScreen({
    super.key,
    required this.category,
    required this.question,
  });

  @override
  State<ThreadDetailScreen> createState() => _ThreadDetailScreenState();
}

class _ThreadDetailScreenState extends State<ThreadDetailScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      appBar: const ThreadScreenAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                SizedBox(height: 16.h),

                Text(
                  widget.category,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 13.h),

                QuestionCard(question: widget.question),

                SizedBox(height: 32.h),

                const MessageBubble(
                  sender: "김영희 선생님",
                  text: "안녕하세요, 이번주 숙제는 0000 까지 풀어오면 됩니다.",
                  time: "오전 9:31",
                  isMe: false,
                  bubbleColor: Colors.white,
                  textColor: Colors.black,
                ),
                const MessageBubble(
                  text: "000까지 맞을까요?",
                  time: "오전 10:15",
                  isMe: true,
                  bubbleColor: Color(0xFFB0D0C4),
                  textColor: Colors.black,
                ),
              ],
            ),
          ),

          BottomArea(
            controller: _controller,
            onSend: (isThreadOnly) {
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
