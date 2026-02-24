import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/chat/utils/index.dart';

class ChatThreadsScreen extends StatelessWidget {
  const ChatThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8E9),
      appBar: const ThreadScreenAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "숙제 관련",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.h),

            const QnACard(
              question: "선생님~ 이번주 숙제 알 수 있을까요?",
              answer: "숙제는 내일 중으로 공지될 예정입니다.",
            ),
            SizedBox(height: 16.h),

            const QnACard(
              question: "방학 기간 숙제가 있을까요?",
              answer: "넵 통신문으로 안내 예정입니다.",
            ),
          ],
        ),
      ),
    );
  }
}
