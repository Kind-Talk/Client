import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:front_end/features/home/utils/index.dart';
import 'package:front_end/features/settings/views/widgets/student_info_widgets.dart';


class StudentInfoScreen extends StatefulWidget {
  const StudentInfoScreen({super.key});

  @override
  State<StudentInfoScreen> createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends State<StudentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            StudentInfoHeader(),

            SizedBox(height: 16.h,),

            StudentInfoInfoTab(),

            SizedBox(height: 24.h,),

            StudentInfoCard(studentName: "홍시아"),

            SizedBox(height: 24.h,),

            StudentInfoCard(studentName: "홍서준"),
          ],
        ),
      ),
    );
  }
}