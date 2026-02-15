import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';

class ParentSettingsBody extends StatelessWidget {
  const ParentSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Uncomment it for visualize Container area
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.black,
      //     width: 1.sp,
      //   )
      // ),
      child: Column(
        children: [
          AddStudent(),

          StudentInfo(),
        ],
      ),
    );
  }
}