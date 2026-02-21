import 'package:flutter/material.dart';
import 'package:front_end/features/settings/views/widgets/add_student_widgets.dart';

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
        child: Column(
          children: [
            AddStudentHeader(),

            AddStudentInfoTab(),

            GetName(),

            GetBirthDate(),

            GetSchool(),

            AddStudentButton(),

            CancelButton(),
          ],
        ),
      ),
    );
  }
}