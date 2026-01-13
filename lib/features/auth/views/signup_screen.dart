import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_end/features/auth/utils/index.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  List<dynamic> textFieldInput = [
    ['이메일', 'example@email.com', CupertinoIcons.envelope, false],
    ['비밀번호', '••••••••', CupertinoIcons.lock, true],
    ['비밀번호 확인', '••••••••', CupertinoIcons.lock, true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.95.w),
            child: Column(
              children: [
                SizedBox(height: 124.25.h),

                // 상단 헤더
                const AuthHeader(title: '카인드톡', subtitle: '회원가입'),
                SizedBox(height: 32.h),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.75.w,
                    vertical: 32.77.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0ECE4),
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 입력창 위젯
                      const AuthLabel(text: '이름'),
                      SizedBox(height: 8.h),
                      _simpleTextField(),

                      for (var item in textFieldInput) ...[
                        SizedBox(height: 17.h),
                        AuthLabel(text: item[0]),
                        SizedBox(height: 8.h),
                        AuthTextField(
                          hint: item[1],
                          icon: item[2],
                          isPassword: item[3],
                        ),
                      ],

                      SizedBox(height: 17.h),

                      const AuthLabel(text: '학교검색'),
                      SizedBox(height: 8.h),
                      _simpleTextField(),

                      SizedBox(height: 33.94.h),

                      // 회원가입 버튼
                      AuthSignButton(
                        text: '회원가입',
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 단순 입력창
Widget _simpleTextField() {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFFF3F3F5),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.5.h),
        filled: true,
        fillColor: Colors.transparent,
      ),
    ),
  );
}
