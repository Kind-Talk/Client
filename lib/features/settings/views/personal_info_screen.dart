import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/common/constants/app_constants.dart';
import 'package:front_end/features/auth/providers/auth_provider.dart';
import 'package:front_end/features/settings/views/widgets/add_student_widgets.dart';
import 'package:front_end/features/settings/views/widgets/edit_student_info_widgets.dart';
import 'package:front_end/features/settings/views/widgets/personal_info_widgets.dart';

// ======== 개인 정보 수정 - 화면 ========
class PersonalInfoScreen extends ConsumerStatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  ConsumerState<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends ConsumerState<PersonalInfoScreen> {
  late final TextEditingController _userNameController;
  late final TextEditingController _nickNameController;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    // initState에서 초기화 → dispose 시 항상 안전하게 해제 가능
    final member = ref.read(authProvider).valueOrNull;
    _userNameController = TextEditingController(text: member?.userName ?? '');
    _nickNameController = TextEditingController(text: member?.nickName ?? '');
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _nickNameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final userName = _userNameController.text.trim();
    final nickName = _nickNameController.text.trim();

    if (userName.isEmpty || nickName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이름과 닉네임을 입력해주세요.')),
      );
      return;
    }

    setState(() => _isSaving = true);

    await ref.read(authProvider.notifier).updateMe(
      userName: userName,
      nickName: nickName,
    );

    if (!mounted) return;
    setState(() => _isSaving = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final member = ref.watch(authProvider).valueOrNull;

    if (member == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            PersonalInfoHeader(),
            SizedBox(height: 16.h),

            PersonalInfoInfoTab(email: member.email, role: member.role),
            SizedBox(height: 24.h),

            PersonalInfoTextField(
              label: '이름',
              iconPath: 'assets/icons/personal_green.svg',
              controller: _userNameController,
              hintText: '이름을 입력하세요',
            ),
            SizedBox(height: 16.h),

            PersonalInfoTextField(
              label: '닉네임',
              iconPath: 'assets/icons/personal_green.svg',
              controller: _nickNameController,
              hintText: '닉네임을 입력하세요',
            ),
            SizedBox(height: 128.h),

            SaveButton(isLoading: _isSaving, onTap: _isSaving ? null : _save),
            SizedBox(height: 12.h),

            CancelButton(onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
