import 'package:front_end/features/home/utils/index.dart';

import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isTeacherMode = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      (isTeacherMode ? TeacherHomeBody() : ParentsHomeBody()), // 교사-학부모 전환
      const Center(child: Text(("연락처"))),
      const Center(child: Text("탐색")),
      SettingsScreen(
        isTeacherMode: isTeacherMode,
        onTeacherModeChanged: (v) => setState(() => isTeacherMode = v),
      ), // 추후 회원정보에서 받아오기
    ];

    return Scaffold(
      backgroundColor: isTeacherMode ? Color(0xFFE9F4ED) : Color(AppConstants.backgroundColor),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFFBFD7C8),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: '채팅방',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: '연락처',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.compass),
            label: '탐색',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}