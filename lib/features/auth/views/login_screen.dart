import 'package:front_end/features/auth/utils/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isKeepLogin = false;
  List<dynamic> textFieldInput = [
    ['이메일', 'example@email.com', CupertinoIcons.envelope, false],
    ['비밀번호', '••••••••', CupertinoIcons.lock, true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.99.w),
            child: Column(
              children: [
                SizedBox(height: 121.58.h),

                // 상단 로고 및 타이틀
                const AuthHeader(title: '카인드톡', subtitle: '계정에 로그인하세요'),
                SizedBox(height: 32.84.h),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.71.w,
                    vertical: 24.71.h,
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
                      for (var item in textFieldInput) ...[
                        AuthLabel(text: item[0]),
                        SizedBox(height: 8.h),
                        AuthTextField(
                          hint: item[1],
                          icon: item[2],
                          isPassword: item[3],
                        ),

                        SizedBox(height: 16.h),
                      ],

                      SizedBox(height: 15.99.h),

                      // 로그인 유지 & 비밀번호 찾기
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 24.71.w,
                                height: 20.w,
                                child: Checkbox(
                                  value: isKeepLogin,
                                  onChanged: (value) {
                                    setState(() {
                                      isKeepLogin = value!;
                                    });
                                  },
                                  activeColor: const Color(0xFF357D58),
                                  side: const BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '로그인 상태 유지',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '비밀번호 찾기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15.99.h),

                      // 로그인 버튼
                      AuthSignButton(
                        text: '로그인',
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),

                      SizedBox(height: 15.99.h),

                      // 다른 방법으로 로그인
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey[400])),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              '또는 다른 방법으로 로그인',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey[400])),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      // 소셜 로그인 버튼들
                      Row(
                        children: [
                          Expanded(
                            child: const AuthSocialButton(
                              text: 'Google',
                              bgColor: Colors.white,
                              textColor: Colors.black,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: const AuthSocialButton(
                              text: '카카오톡',
                              bgColor: Color(0xFFFEE500),
                              textColor: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 27.77.h),

                      // 회원가입 링크
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.sp,
                            ),
                            children: [
                              const TextSpan(text: '계정이 없으신가요?  '),
                              TextSpan(
                                text: '회원가입',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),

                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.72.h),

                // 하관 약관 텍스트
                Text(
                  '로그인 하면 서비스 약관 및 개인정보 보호정책\n동의하는 것으로 간주됩니다',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
                ),
                SizedBox(height: 96.85.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
