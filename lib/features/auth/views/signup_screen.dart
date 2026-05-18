import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/common/models/member.dart';
import 'package:front_end/features/auth/providers/auth_provider.dart';
import 'package:front_end/features/auth/utils/index.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _userNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _schoolCodeController = TextEditingController();

  Role _selectedRole = Role.parent;

  @override
  void dispose() {
    _userNameController.dispose();
    _nickNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _schoolCodeController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    final password = _passwordController.text.trim();
    final passwordConfirm = _passwordConfirmController.text.trim();

    if (_userNameController.text.trim().isEmpty ||
        _nickNameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필수 항목을 입력해주세요.')),
      );
      return;
    }

    if (password != passwordConfirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 일치하지 않습니다.')),
      );
      return;
    }

    final schoolCode = _schoolCodeController.text.trim();

    await ref.read(authProvider.notifier).signup(
      email: _emailController.text.trim(),
      password: password,
      userName: _userNameController.text.trim(),
      nickName: _nickNameController.text.trim(),
      role: _selectedRole,
      schoolCode: schoolCode.isEmpty ? null : schoolCode,
    );

    if (!mounted) return;

    final authState = ref.read(authProvider);
    authState.when(
      data: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('회원가입이 완료됐습니다. 로그인해주세요.')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      },
      error: (e, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('회원가입에 실패했습니다. 다시 시도해주세요.')),
        );
      },
      loading: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authProvider).isLoading;

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
                      // 이름
                      const AuthLabel(text: '이름'),
                      SizedBox(height: 8.h),
                      AuthTextField(
                        hint: '홍길동',
                        icon: CupertinoIcons.person,
                        isPassword: false,
                        controller: _userNameController,
                      ),

                      SizedBox(height: 17.h),

                      // 닉네임
                      const AuthLabel(text: '닉네임'),
                      SizedBox(height: 8.h),
                      AuthTextField(
                        hint: '앱에서 표시될 이름',
                        icon: CupertinoIcons.smiley,
                        isPassword: false,
                        controller: _nickNameController,
                      ),

                      SizedBox(height: 17.h),

                      // 이메일
                      const AuthLabel(text: '이메일'),
                      SizedBox(height: 8.h),
                      AuthTextField(
                        hint: 'example@email.com',
                        icon: CupertinoIcons.envelope,
                        isPassword: false,
                        controller: _emailController,
                      ),

                      SizedBox(height: 17.h),

                      // 비밀번호
                      const AuthLabel(text: '비밀번호'),
                      SizedBox(height: 8.h),
                      AuthTextField(
                        hint: '••••••••',
                        icon: CupertinoIcons.lock,
                        isPassword: true,
                        controller: _passwordController,
                      ),

                      SizedBox(height: 17.h),

                      // 비밀번호 확인
                      const AuthLabel(text: '비밀번호 확인'),
                      SizedBox(height: 8.h),
                      AuthTextField(
                        hint: '••••••••',
                        icon: CupertinoIcons.lock,
                        isPassword: true,
                        controller: _passwordConfirmController,
                      ),

                      SizedBox(height: 17.h),

                      // 역할 선택
                      const AuthLabel(text: '역할'),
                      SizedBox(height: 8.h),
                      _RoleSelector(
                        selected: _selectedRole,
                        onChanged: (role) => setState(() => _selectedRole = role),
                      ),

                      // 학교 검색 (선생님만)
                      if (_selectedRole == Role.teacher) ...[
                        SizedBox(height: 17.h),
                        const AuthLabel(text: '학교 코드'),
                        SizedBox(height: 8.h),
                        AuthTextField(
                          hint: '학교 코드를 입력하세요',
                          icon: CupertinoIcons.building_2_fill,
                          isPassword: false,
                          controller: _schoolCodeController,
                        ),
                      ],

                      SizedBox(height: 33.94.h),

                      // 회원가입 버튼
                      AuthSignButton(
                        text: isLoading ? '처리 중...' : '회원가입',
                        onTap: isLoading ? () {} : _signup,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ======== STATELESS WIDGETS ========

// 역할 선택 버튼 (학부모 / 선생님)
class _RoleSelector extends StatelessWidget {
  final Role selected;
  final ValueChanged<Role> onChanged;

  const _RoleSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _RoleButton(
            label: '학부모',
            isSelected: selected == Role.parent,
            onTap: () => onChanged(Role.parent),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _RoleButton(
            label: '선생님',
            isSelected: selected == Role.teacher,
            onTap: () => onChanged(Role.teacher),
          ),
        ),
      ],
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(AppConstants.buttonColor) : const Color(0xFFF3F3F5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[600],
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
