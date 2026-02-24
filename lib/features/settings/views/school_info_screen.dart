import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:front_end/features/auth/utils/index.dart';
import 'package:front_end/features/settings/views/widgets/school_info_widgets.dart';

// ======== 학교 정보 수정 - 화면 ========
class SchoolInfoScreen extends StatefulWidget {
  const SchoolInfoScreen({super.key});

  @override
  State<SchoolInfoScreen> createState() => _SchoolInfoScreenState();
}

class _SchoolInfoScreenState extends State<SchoolInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            SchoolInfoHeader(),

            SizedBox(height: 16.h,),

            SchoolInfoInfoTab(),

          ],
        ),
      ),
    );
  }
}