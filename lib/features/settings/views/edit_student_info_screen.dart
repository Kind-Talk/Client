import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:front_end/features/home/utils/index.dart';
import 'package:front_end/features/settings/views/widgets/add_student_widgets.dart';
import 'package:front_end/features/settings/views/widgets/edit_student_info_widgets.dart';

class EditStudentInfoScreen extends StatefulWidget {
  final String studentName;
  final String schoolName;
  final int grade;

  const EditStudentInfoScreen({
    super.key,
    required this.studentName,
    required this.schoolName,
    required this.grade,
  });

  @override
  State<EditStudentInfoScreen> createState() => _EditStudentInfoScreenState();
}

class _EditStudentInfoScreenState extends State<EditStudentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            EditStudentInfoHeader(studentName: widget.studentName),

            SizedBox(height: 16.h,),

            EditStudentInfoInfo(
              studentName: widget.studentName,
              schoolName: widget.schoolName,
              grade: widget.grade,  
            ),

            SizedBox(height: 24.h,),

            GetSchool(),

            SizedBox(height: 128.h,),

            SaveButton(),

            SizedBox(height: 12.h),

            CancelButton(),
          ],
        ),
      ),
    );
  }
}