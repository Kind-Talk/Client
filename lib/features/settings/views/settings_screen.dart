import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';
import 'package:front_end/features/settings/views/widgets/parent_settings_body.dart';
import 'package:front_end/features/settings/views/widgets/teacher_settings_body.dart';

enum Usermode { teacher, parent } // 교사 - 학부모 전환용 모드 정의

// ======== 설정 홈 - 화면 ========
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Usermode _mode = Usermode.parent; // 임시로 하드 코딩 -> 유저 정보에서 받아와야 함.

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Header(),

          Container(
            width: 393.w,
            height: 450.h,
            child: Column(
              children: [
                RoleToggleButton(),

                PersonalInfo(),

                SizedBox(height: 16.h),

                _mode == Usermode.teacher? TeacherSettingsBody() : ParentSettingsBody(),

                SizedBox(height: 16.h),

                SignOut(),
              ],
            ),
          ),
          
          Versions(),
        ],
      )
    );
  }
}