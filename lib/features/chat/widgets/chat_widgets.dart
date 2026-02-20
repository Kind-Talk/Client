import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_end/features/chat/views/chat_threads_screen.dart';

// 주제별 정리 위젯
class TopicSection extends StatefulWidget {
  const TopicSection({super.key});

  @override
  State<TopicSection> createState() => _TopicSectionState();
}

class _TopicSectionState extends State<TopicSection> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "주제별 정리",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            _isExpanded ? "스레드 숨기기" : "스레드 보기",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.grey,
                            size: 16.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          if (_isExpanded)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  const TopicCard(
                    title: "숙제 관련",
                    preview: "선생님 이번 주 숙제 알 수 있을까요?",
                    time: "2시간 전",
                  ),
                  SizedBox(width: 16.w),
                  const TopicCard(
                    title: "방학 관련",
                    preview: "선생님 ~ 이번 방학 기간이 ... ",
                    time: "5시간 전",
                  ),
                ],
              ),
            ),

          if (_isExpanded)
            Padding(
              padding: EdgeInsets.only(left: 16.w, bottom: 25.h, top: 29.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatThreadsScreen(),
                    ),
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "스레드 전체 확인하기",
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey, size: 16.w),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

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

// 말풍선 위젯
class MessageBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;
  final String? sender;
  final Color bubbleColor;
  final Color textColor;

  const MessageBubble({
    super.key,
    required this.bubbleColor,
    required this.isMe,
    this.sender,
    required this.text,
    required this.textColor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!isMe && sender != null) ...[
            Text(
              sender!,
              style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
            ),
            SizedBox(height: 4.h),
          ],
          Row(
            mainAxisAlignment: isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isMe) ...[
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
                ),
                SizedBox(width: 4.w),
              ],
              Container(
                constraints: BoxConstraints(maxWidth: 240.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: bubbleColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                    bottomLeft: isMe
                        ? Radius.circular(16.r)
                        : Radius.circular(0),
                    bottomRight: isMe
                        ? Radius.circular(0)
                        : Radius.circular(16.r),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 14.sp),
                ),
              ),
              if (!isMe) ...[
                SizedBox(width: 4.w),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// 채팅 입력 위젯
class InputArea extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSendPressed;

  const InputArea({
    super.key,
    required this.controller,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[200]!)),
        ),
        child: Row(
          children: [
            Icon(Icons.attach_file, color: Colors.grey[600]),
            SizedBox(width: 12.w),
            Icon(CupertinoIcons.photo, color: Colors.grey[600]),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16.w),
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3f3F5),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "메시지를 입력하세요...",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.sentiment_satisfied_alt,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: onSendPressed,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFE0E0E0),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 채팅방 상단바 위젯
class ChatRoomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String teacherName;
  final String schoolName;

  const ChatRoomAppBar({
    super.key,
    required this.schoolName,
    required this.teacherName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFB0D0C4),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teacherName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            schoolName,
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
