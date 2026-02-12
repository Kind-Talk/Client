import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Header(),

          RoleToggleButton(),

          Container(
            width: 393.w,
            height: 450.h,
            child: Column(
              children: [
                PersonalInfo(),

                SizedBox(height: 16.h),

                SchoolInfo(),

                SizedBox(height: 16.h),

                SignOut(),
              ],
            ),
          ),
        ],
      )
    );
  }
}