import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/common/constants/app_constants.dart';
import 'package:front_end/features/settings/models/child_model.dart';
import 'package:front_end/features/settings/models/school_model.dart';
import 'package:front_end/features/settings/providers/child_provider.dart';
import 'package:front_end/features/settings/views/widgets/add_student_widgets.dart';
import 'package:front_end/features/settings/views/widgets/edit_student_info_widgets.dart';
import 'package:front_end/features/settings/views/widgets/search_school_widgets.dart';

// ======== 자녀 정보 수정 - 화면 ========
class EditStudentInfoScreen extends ConsumerStatefulWidget {
  final ChildModel child;

  const EditStudentInfoScreen({super.key, required this.child});

  @override
  ConsumerState<EditStudentInfoScreen> createState() =>
      _EditStudentInfoScreenState();
}

class _EditStudentInfoScreenState extends ConsumerState<EditStudentInfoScreen> {
  late final TextEditingController _nameController;
  SchoolModel? _selectedSchool;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.child.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('자녀 이름을 입력해주세요.')),
      );
      return;
    }

    await ref.read(childrenProvider.notifier).edit(
      childId: widget.child.id,
      name: name,
      schoolCode: _selectedSchool?.code ?? widget.child.schoolCode,
    );

    if (!mounted) return;
    Navigator.pop(context);
  }

  Future<void> _delete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('자녀 삭제'),
        content: Text('${widget.child.name} 학생을 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('삭제', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    await ref.read(childrenProvider.notifier).remove(widget.child.id);

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(childrenProvider).isLoading;
    final schoolName = _selectedSchool?.name ?? widget.child.schoolName;

    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            EditStudentInfoHeader(studentName: widget.child.name),
            SizedBox(height: 16.h),

            EditStudentInfoInfo(
              studentName: widget.child.name,
              schoolName: schoolName,
            ),
            SizedBox(height: 24.h),

            GetName(controller: _nameController),
            SizedBox(height: 16.h),

            GetSchool(
              selectedSchool: _selectedSchool,
              onTap: () async {
                final school = await showSchoolSearchTab(context);
                if (school != null) setState(() => _selectedSchool = school);
              },
            ),
            SizedBox(height: 16.h),

            // 삭제 버튼
            _DeleteButton(onTap: isLoading ? null : _delete),
            SizedBox(height: 128.h),

            SaveButton(isLoading: isLoading, onTap: isLoading ? null : _save),
            SizedBox(height: 12.h),

            CancelButton(onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _DeleteButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        '자녀 삭제',
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.red,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
