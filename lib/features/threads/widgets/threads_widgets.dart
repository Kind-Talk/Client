import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_end/features/chat/utils/index.dart';
import 'package:front_end/features/threads/views/thread_detail_screen.dart';

// 상단 바
class ThreadScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ThreadScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFB0D0C4),
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(CupertinoIcons.book, size: 18.w, color: Colors.black87),
          ),
          SizedBox(width: 12.w),
          Text(
            "최근 올라온 질문",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 스레드 카드
class QnACard extends StatelessWidget {
  final String question;
  final String answer;

  const QnACard({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ThreadDetailScreen(category: "숙제 관련", question: question),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFBF1D1),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [Q] 영역
            Text(
              "Q",
              style: TextStyle(
                fontSize: 20.sp,
                color: const Color(AppConstants.emphasisColor),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              question,
              style: TextStyle(fontSize: 15.sp, color: Colors.black87),
            ),

            SizedBox(height: 12.h),

            Divider(color: Color(0xFFBFD7C8), thickness: 1, height: 1),

            SizedBox(height: 8.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(AppConstants.emphasisColor),
                  ),
                ),
                SizedBox(width: 13.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      answer,
                      style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
