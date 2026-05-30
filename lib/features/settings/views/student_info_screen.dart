import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/common/constants/app_constants.dart';
import 'package:front_end/features/settings/models/child_model.dart';
import 'package:front_end/features/settings/providers/child_provider.dart';
import 'package:front_end/features/settings/views/edit_student_info_screen.dart';
import 'package:front_end/features/settings/views/widgets/student_info_widgets.dart';

// ======== 자녀 정보 - 화면 ========
class StudentInfoScreen extends ConsumerWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenState = ref.watch(childrenProvider);

    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            StudentInfoHeader(),
            SizedBox(height: 16.h),
            StudentInfoInfoTab(),
            SizedBox(height: 24.h),

            childrenState.when(
              data: (children) {
                if (children.isEmpty) {
                  return Text(
                    '등록된 자녀가 없습니다.',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: children.length,
                    separatorBuilder: (_, _) => SizedBox(height: 16.h),
                    itemBuilder: (context, i) =>
                        _ChildCard(child: children[i]),
                  ),
                );
              },
              loading: () =>
                  const Expanded(child: Center(child: CircularProgressIndicator())),
              error: (_, _) => Text(
                '자녀 정보를 불러오지 못했습니다.',
                style: TextStyle(fontSize: 14.sp, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChildCard extends StatelessWidget {
  final ChildModel child;

  const _ChildCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return StudentInfoCard(
      studentName: child.name,
      schoolName: child.schoolName,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditStudentInfoScreen(child: child),
          ),
        );
      },
    );
  }
}
