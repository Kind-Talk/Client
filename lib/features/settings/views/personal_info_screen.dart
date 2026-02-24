import 'package:flutter/material.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';

// ======== 개인 정보 수정 - 화면 ========
class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Header(),

              Text("개인 설정 페이지")
            ],
          ),
        ),
      ),
    );
  }
}