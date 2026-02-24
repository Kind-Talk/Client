import 'package:flutter/material.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';

// ======== 설정 화면 - 학부모 ========
class ParentSettingsBody extends StatelessWidget {
  const ParentSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [AddStudent(), StudentInfo()]);
  }
}
