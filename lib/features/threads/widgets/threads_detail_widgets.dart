import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/chat/utils/index.dart';

// 질문 카드
class QuestionCard extends StatelessWidget {
  final String question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
          Text(
            "Q",
            style: TextStyle(
              fontSize: 24.sp,
              color: const Color(AppConstants.emphasisColor),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            question,
            style: TextStyle(fontSize: 15.sp, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

// 하단 영역
class BottomArea extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool isThreadOnly) onSend;

  const BottomArea({super.key, required this.controller, required this.onSend});

  @override
  State<BottomArea> createState() => _BottomAreaState();
}

class _BottomAreaState extends State<BottomArea> {
  bool _isThreadOnly = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isThreadOnly = !_isThreadOnly;
            });
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            color: const Color(0xFFBFD7C8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  _isThreadOnly
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: Colors.white,
                  size: 20.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  "이 스레드에만 보내기",
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),

        InputArea(
          controller: widget.controller,
          onSendPressed: () {
            widget.onSend(_isThreadOnly);
          },
        ),
      ],
    );
  }
}
