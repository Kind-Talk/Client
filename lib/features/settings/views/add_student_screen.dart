import 'package:front_end/features/home/utils/index.dart';
import 'package:front_end/features/settings/views/widgets/add_student_widgets.dart';

// ======== 자녀 추가 - 화면 ========
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundColor),
      body: SafeArea(
        child: Column(
          children: [
            AddStudentHeader(),

            SizedBox(height: 16.h),

            AddStudentInfoTab(),

            SizedBox(height: 24.h),

            GetName(),

            SizedBox(height: 16.h),

            GetBirthDate(),

            SizedBox(height: 16.h),

            GetSchool(),

            SizedBox(height: 24.h),

            AddStudentButton(),

            SizedBox(height: 12.h),

            CancelButton(),
          ],
        ),
      ),
    );
  }
}
