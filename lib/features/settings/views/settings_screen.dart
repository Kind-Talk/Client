import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< Updated upstream
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';
=======
import 'package:front_end/common/constants/app_constants.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';
import 'package:front_end/features/settings/views/widgets/parent_settings_body.dart';
import 'package:front_end/features/settings/views/widgets/teacher_settings_body.dart';
>>>>>>> Stashed changes

// ======== 설정 홈 - 화면 ========
class SettingsScreen extends StatefulWidget {
  final bool isTeacherMode;
  final ValueChanged<bool> onTeacherModeChanged;

  const SettingsScreen({
    super.key,
    required this.isTeacherMode,
    required this.onTeacherModeChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Container(
      child: Column(
        children: [
          Header(),

          Container(
            width: 393.w,
            height: 450.h,
            // Uncomment it for visualize Container area
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.black,
            //     width: 1.sp,
            //   )
            // ),
            child: Column(
              children: [
                RoleToggleButton(),

                PersonalInfo(),

                SizedBox(height: 16.h),

                SchoolInfo(),

                SizedBox(height: 16.h),

                SignOut(),
              ],
            ),
          ),
          
          Versions(),
        ],
      )
=======
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
                    isTeacherMode: widget.isTeacherMode,
                    onChanged: widget.onTeacherModeChanged,
                  ),

                  PersonalInfo(),

                  SizedBox(height: 16.h),

                  (widget.isTeacherMode ? TeacherSettingsBody() : ParentSettingsBody()),

                  SizedBox(height: 16.h),

                  SignOut(),
                ],
              ),
            ),
            
            Versions(),
          ],
        ),
      ),
>>>>>>> Stashed changes
    );
  }
}