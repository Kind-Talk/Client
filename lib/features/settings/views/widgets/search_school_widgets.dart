import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSchoolTab extends StatelessWidget {
  const SearchSchoolTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 200.h,

      decoration: BoxDecoration(
        color: Colors.white,
      ),

      child: Column(
        children: [
          Text("학교 이름을 검색하세요"),

          Text("ex) 유현초"),

          TextField(),
        ],
      ),
    );
  }
}