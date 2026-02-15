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
    );
  }
}