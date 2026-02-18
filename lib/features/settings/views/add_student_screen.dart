import 'package:flutter/material.dart';
import 'package:front_end/features/settings/views/widgets/settings_widgets.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Header(),

              Text("자녀 추가")
            ],
          ),
        ),
      ),
    );
  }
}