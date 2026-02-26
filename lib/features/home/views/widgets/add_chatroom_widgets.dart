import 'package:flutter/cupertino.dart';
import 'package:front_end/features/home/utils/index.dart';

// ======== FUNCTIONS ========
// 새 채팅방 만들기 탭 calling 함수
Future<void> showCreateChatroomTab(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: const Color(0x33111111),
    builder: (_) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const CreateNewChatroomTab(),
    ),
  );
}

// ======== STATELESS WIDGETS ========
// 새 채팅방 만들기 탭
class CreateNewChatroomTab extends StatelessWidget {
  const CreateNewChatroomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 220.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFFD2E9DB),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "새로운 채팅방 만들기",
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          SizedBox(height: 24.h,),

          Container(
            width: 302.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16.r)
            ),
            child: CupertinoTextFormFieldRow(
              placeholder: "채팅방 이름",
            ),
          ),

          SizedBox(height: 24.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                buttonText: "취소",
                buttonColor: 0xFFFFFFFF,
                textColor: 0xFF0A0A0A,
              ),

              SizedBox(width: 14.w,),

              ActionButton(
                buttonText: "완료",
                buttonColor: 0xFF2F7D4E,
                textColor: 0xFFFFFFFF,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 취소 / 완료 버튼
class ActionButton extends StatelessWidget {
  final String buttonText;
  final int buttonColor;
  final int textColor;
  final Widget action = const Placeholder(); // 추후 백엔드와 연계할 때 사용 예정
  const ActionButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {},
        child: Ink(
          width: 144.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Color(buttonColor),
            borderRadius: BorderRadius.circular(16.r),
          ),

          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Color(textColor),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}