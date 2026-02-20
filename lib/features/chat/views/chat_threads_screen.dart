import 'package:flutter/material.dart';

class ChatThreadsScreen extends StatelessWidget {
  const ChatThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB0D0C4),
        title: const Text('전체 스레드 확인', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black), // 뒤로가기 버튼 검은색
        elevation: 0,
      ),
      body: const Center(child: Text("여기에 전체 스레드 목록이 들어갈 예정입니다.")),
    );
  }
}
