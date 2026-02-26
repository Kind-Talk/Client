import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

// 주제 스레드 카드 위젯
class TopicCard extends StatelessWidget {
  final String title;
  final String preview;
  final String time;

  const TopicCard({
    super.key,
    required this.preview,
    required this.time,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
        bottom: 36.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF8E8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.chat_bubble, size: 14.w, color: Colors.grey),
              SizedBox(width: 4.w),
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
              Spacer(),
              Icon(Icons.chevron_right, size: 16.w, color: Colors.grey),
            ],
          ),
          SizedBox(height: 7.h),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 9.h),
          Text(
            preview,
            style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// 채팅방 상단바 위젯
class TeacherChatroomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int schoolYear;       // 학년도
  final int grade;            // 학년
  final String session;       // 반
  final String classroomCode; // 채팅방 코드

  const TeacherChatroomAppBar({
    super.key,
    required this.schoolYear,
    required this.grade,
    required this.session,
    required this.classroomCode,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFBF1D1),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$schoolYear학년도 $grade-$session반",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            classroomCode,
            style: TextStyle(color: Colors.black54, fontSize: 12.sp),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
