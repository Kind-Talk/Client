import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ======== STATELESS WIDGETS ========
// 자녀 추가 헤더
class AddStudentHeader extends StatelessWidget {
  const AddStudentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      padding: EdgeInsets.all(16.h),

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

      child: Row(
        children: [
          Text("icon"),

          Text(
            '설정',
            style: TextStyle(
              fontSize: 16.h,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1C4B2F),
            ),
          ),
        ],
      ),
    );
  }
}

// 자녀 추가 정보 탭
class AddStudentInfoTab extends StatelessWidget {
  const AddStudentInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Color(0xFFE0ECE4),
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
        children: [
          Row(
            children: [
              Text("icon"),

              Text("자녀 정보 입력"),
            ],
          ),

          Text("자녀의 학교, 생년월일, 이름을 정확히 입력해주세요"),
        ],
      ),
    );
  }
}

// 이름 정보 입력
class GetName extends StatelessWidget {
  const GetName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.all(16.w),

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
        children: [
          Row(
            children: [
              Text("Icon"),

              Text(
                "이름",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h,),

          SizedBox(
            width: 320.w,
            height: 36.h,

            child: TextField(
              decoration: InputDecoration(
                labelText: '자녀의 이름을 입력하세요',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide.none,
                ),

                filled: true,
                fillColor: Color(0xF3F3F5FF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 생년월일 정보 입력
class GetBirthDate extends StatelessWidget {
  const GetBirthDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.all(16.w),

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
        children: [
          Row(
            children: [
              Text("Icon"),

              Text(
                "생년월일",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h,),

          Container(
            width: 320.w,
            height: 36.h,
            decoration: BoxDecoration(),

            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              readOnly: true,
              decoration: InputDecoration(
                hintText: '생년월일 선택',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide.none,
                ),

                filled: true,
                fillColor: Color(0xF3F3F5FF),
              ),

              onTap: () async {
                final picked = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000), 
                  lastDate: DateTime(2100)
                );

                if (picked != null) {
                  debugPrint('$picked'); // 임시
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 학교 정보 입력
class GetSchool extends StatelessWidget {
  const GetSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      padding: EdgeInsets.all(16.w),

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
        children: [
          Row(
            children: [
              Text("Icon"),

              Text(
                "학교",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                ),
              ),
            ],
          ),

          Text("학교 이름을 검색하세요"),
        ],
      ),
    );
  }
}

// 자녀 추가하기 버튼
class AddStudentButton extends StatelessWidget {
  const AddStudentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 360.w,
      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Color(0xFFE0ECE4),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Text(
        "자녀 추가하기",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF0A0A0A),
        ),
      ),
    );
  }
}

// 취소 버튼
class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 360.h,
      padding: EdgeInsets.all(16.w),

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

      child: Text(
        "취소",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF0A0A0A),
        ),
      ),
    );
  }
}