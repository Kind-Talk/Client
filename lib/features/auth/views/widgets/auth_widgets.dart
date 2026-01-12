import 'package:front_end/features/auth/views/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 상단 헤더 위젯
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsPath.logo, width: 64.w),
        SizedBox(height: 15.15.h),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 7.15.h),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

// 입력창 라벨
class AuthLabel extends StatelessWidget {
  final String text;

  const AuthLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0A0A0A),
      ),
    );
  }
}

// 입력창 위젯
class AuthTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[600], size: 19.99.w),
          suffixIcon: isPassword
              ? Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.grey,
                  size: 19.99.w,
                )
              : null,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.5.h,
            horizontal: 10.h,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}

// 소셜 버튼 위젯
class AuthSocialButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const AuthSocialButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (text == 'Google') Icon(Icons.g_mobiledata, color: textColor),
          if (text == '카카오톡')
            Icon(
              CupertinoIcons.chat_bubble_fill,
              size: 19.99.w,
              color: textColor,
            ),
          SizedBox(width: 15.99.w),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

// 로그인, 회원가입 버튼
class AuthSignButton extends StatelessWidget {
  final String text;

  const AuthSignButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2F7D4E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
