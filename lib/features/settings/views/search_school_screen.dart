import 'package:flutter/material.dart';
import 'package:front_end/features/settings/views/widgets/search_school_widgets.dart';

class SearchSchoolScreen extends StatefulWidget {
  const SearchSchoolScreen({super.key});

  @override
  State<SearchSchoolScreen> createState() => _SearchSchoolScreenState();
}

class _SearchSchoolScreenState extends State<SearchSchoolScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },

      child: Container(
        decoration: BoxDecoration(
          color: Color(0x33111111),
        ),

        child: SearchSchoolTab(),
      ),
    );
  }
}