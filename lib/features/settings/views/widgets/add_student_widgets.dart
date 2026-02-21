import 'package:flutter/material.dart';

// ======== STATELESS WIDGETS ========
// 이름 정보 입력
class GetName extends StatelessWidget {
  const GetName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Icon"),

            Text("이름")
          ],
        ),

        Text("자녀의 이름을 입력하세요"),
      ],
    );
  }
}

// 생년월일 정보 입력
class GetBirthDate extends StatelessWidget {
  const GetBirthDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Icon"),

            Text("생년월일")
          ],
        ),

        Text("yyyy/mm/dd"),
      ],
    );
  }
}

// 학교 정보 입력
class GetSchool extends StatelessWidget {
  const GetSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Icon"),

            Text("학교")
          ],
        ),

        Text("학교 이름을 검색하세요"),
      ],
    );
  }
}

// 자녀 추가하기 버튼
class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("자녀 추가하기"),
    );
  }
}

// 취소 버튼
class Cancel extends StatelessWidget {
  const Cancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("취소"),
    );
  }
}