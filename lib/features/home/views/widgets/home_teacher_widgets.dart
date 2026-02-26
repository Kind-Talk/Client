import 'package:front_end/features/home/utils/index.dart';
import 'package:flutter/cupertino.dart';

// ======== STATELESS WIDGETS ========
// 선생 홈 - 헤더
class TeacherHomeHeader extends StatelessWidget {
  const TeacherHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133.h,
      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "수업 채팅방",
                style: TextStyle(
                  color: Color(0xFF2A7146),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ), 

              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color(0xFFF8E9A6),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  CupertinoIcons.book, 
                  color: Color(0xFF31533E),
                  size: 24.0,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h,),

          Container(
            height: 36.h,
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: CupertinoTextFormFieldRow(
              placeholder: "채팅방 입력",
              padding: EdgeInsets.all(1.w),
              placeholderStyle: TextStyle(
                color: Color(0xFF717182),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 학급 단체방 카드
class ClassroomCard extends StatelessWidget {
  final int schoolYear;       // 학년도
  final int grade;            // 학년
  final String section;       // 반
  final String chatroomCode;  // 채팅방 코드

  const ClassroomCard({
    super.key,
    required this.schoolYear,
    required this.grade,
    required this.section,
    required this.chatroomCode,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const PersonalInfoScreen()
          //   ),
          // );
        },
        child: Ink(
          width: 362.w,
          height: 156.h,
          padding: EdgeInsets.all(21.w),

          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16.r),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$schoolYear학년 $grade-$section반",
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ), 
                  
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 2.sp),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              Text(
                "채팅방 코드: $chatroomCode",
                style: TextStyle(
                  color: Color(0xFF717182),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Divider(
                color: Color(0xFFF3F4F6),
                thickness: 1,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.chat_bubble,
                        color: Color(0xFFF8E9A6),
                        size: 16.0,
                      ),

                      SizedBox(width: 8.w,),

                      Text(
                        "최근 질문",
                        style: TextStyle(
                          color: Color(0xFF717182),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ), 
                  
                  Text(
                    "어제",
                    style: TextStyle(
                      color: Color(0xFF717182),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              Text(
                "선생님 ~ 이번주 숙제 알 수 있을까요?",
                style: TextStyle(
                  color: Color(0xFF4A5565),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}