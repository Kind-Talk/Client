import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 상단 헤더 위젯
class TopArea extends StatelessWidget {
  const TopArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 17.h,
        bottom: 17.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 + 책 아이콘 부분
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '우리 아이 수업',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2F7D4E),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '선생님께 질문해보세요',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
              // 우측 아이콘 버튼
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  CupertinoIcons.book,
                  color: const Color(0xFF2F7D4E),
                  size: 22.w,
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F8),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.grey[500],
                  size: 22.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '채팅방 코드 입력',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isCollapsed: true, // 높이 틀어짐 방지
                    ),
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 채팅 카드 위젯
class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFBFD7C8),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '읽지 않은 답변',
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                '3개',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            CupertinoIcons.chat_bubble,
            color: Colors.white.withValues(alpha: 0.8),
            size: 40.w,
          ),
        ],
      ),
    );
  }
}

// 선생님 카드 위젯
class TeacherCard extends StatelessWidget {
  final String name;
  final int studentCount;
  final String schoolInfo;
  final String statusMessage;
  final int unreadCount;
  final String lastQuestion;
  final String time;
  final int unreadColor;

  const TeacherCard({
    super.key,
    required this.name,
    required this.studentCount,
    required this.schoolInfo,
    required this.statusMessage,
    required this.unreadCount,
    required this.lastQuestion,
    required this.time,
    required this.unreadColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21.w),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이름 및 뱃지
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  children: [
                    TextSpan(
                      text: name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' ($studentCount)',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              if (unreadCount > 0)
                Container(
                  padding: EdgeInsets.all(7.7.w),
                  decoration: BoxDecoration(
                    color: Color(unreadColor),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unreadCount.toString(),
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 4.h),

          // 학교 정보
          Text(
            schoolInfo,
            style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
          ),

          if (statusMessage.isNotEmpty) ...[
            SizedBox(height: 13.h),
            Text(
              statusMessage,
              style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
            ),
          ],

          SizedBox(height: 12.h),
          const Divider(thickness: 0.5),
          SizedBox(height: 12.h),

          // 최근 질문 내용
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.bubble_left,
                size: 16.w,
                color: Colors.grey[400],
              ),
              SizedBox(width: 8.w),
              Expanded(child: columnForQuestion()),
            ],
          ),
        ],
      ),
    );
  }

  Widget columnForQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "최근 질문",
          style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                lastQuestion,
                style: TextStyle(color: Colors.black87, fontSize: 13.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              time,
              style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }
}
