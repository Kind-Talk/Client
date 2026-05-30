import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/common/constants/app_constants.dart';
import 'package:front_end/features/settings/models/school_model.dart';
import 'package:front_end/features/settings/providers/child_provider.dart';
import 'package:front_end/features/settings/views/widgets/add_student_widgets.dart';
import 'package:front_end/features/settings/views/widgets/search_school_widgets.dart';

// ======== 자녀 추가 - 화면 ========
class AddStudentScreen extends ConsumerStatefulWidget {
  const AddStudentScreen({super.key});

  @override
  ConsumerState<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends ConsumerState<AddStudentScreen> {
  final _nameController = TextEditingController();
  SchoolModel? _selectedSchool;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('자녀 이름을 입력해주세요.')),
      );
      return;
    }
    if (_selectedSchool == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('학교를 선택해주세요.')),
      );
      return;
    }

    await ref.read(childrenProvider.notifier).add(
      name: name,
      schoolCode: _selectedSchool!.code,
    );

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(childrenProvider).isLoading;

    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            AddStudentHeader(),
            SizedBox(height: 16.h),
            AddStudentInfoTab(),
            SizedBox(height: 24.h),

            // 이름 입력
            GetName(controller: _nameController),
            SizedBox(height: 16.h),

            // 학교 선택
            GetSchool(
              selectedSchool: _selectedSchool,
              onTap: () async {
                final school = await showSchoolSearchTab(context);
                if (school != null) setState(() => _selectedSchool = school);
              },
            ),
            SizedBox(height: 24.h),

            // 자녀 추가 버튼
            AddStudentButton(
              isLoading: isLoading,
              onTap: isLoading ? null : _submit,
            ),
            SizedBox(height: 12.h),

            // 취소 버튼
            CancelButton(onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
