import 'package:flutter/material.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';

class TeacherSettingsBody extends StatelessWidget {
  const TeacherSettingsBody({super.key});

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
      child: SchoolInfo(),
    );
  }
}