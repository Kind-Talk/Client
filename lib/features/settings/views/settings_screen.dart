import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/common/constants/app_constants.dart';
import 'package:front_end/features/auth/providers/auth_provider.dart';
import 'package:front_end/features/auth/views/login_screen.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';
import 'package:front_end/features/settings/views/widgets/parent_settings_body.dart';
import 'package:front_end/features/settings/views/widgets/teacher_settings_body.dart';

// ======== 설정 홈 - 화면 ========
class SettingsScreen extends ConsumerWidget {
  final bool isTeacherMode;
  final ValueChanged<bool> onTeacherModeChanged;

  const SettingsScreen({
    super.key,
    required this.isTeacherMode,
    required this.onTeacherModeChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).valueOrNull;

    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            SettingHeader(),

            SizedBox(
              width: 393.w,
              height: 450.h,
              child: Column(
                children: [
                  RoleToggleButton(
                    isTeacherMode: isTeacherMode,
                    onChanged: onTeacherModeChanged,
                  ),

                  PersonalInfo(userName: user?.userName ?? ''),

                  SizedBox(height: 16.h),

                  isTeacherMode
                      ? TeacherSettingsBody()
                      : ParentSettingsBody(),

                  SizedBox(height: 16.h),

                  SignOut(
                    onTap: () async {
                      await ref.read(authProvider.notifier).logout();
                      if (!context.mounted) return;
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

            Versions(),
          ],
        ),
      ),
    );
  }
}
