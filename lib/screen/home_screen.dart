import 'package:flutter/material.dart';
import 'package:jigu/screen/chat_screen.dart';
import 'package:jigu/screen/mypage_screen.dart';
import 'package:jigu/screen/noticeboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // BottomNavigationBar 화면 전환을 위한 인덱스 설정
  int currentindex = 0;
  // BottomNavigationBar 누른 버튼에 따라 바뀌는 body 화면 설정
  List bodyScreen = [
    const NoticeBoardScreen(),
    const ChatScreen(),
    const MypageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 인덱스에 따라 바뀌는 화면 설정
      body: bodyScreen.elementAt(currentindex),
      bottomNavigationBar: BottomNavigationBar(
        // 초기 화면 인덱스 설정
        currentIndex: currentindex,
        // 누르면 인덱스 번호 바뀜
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        // 버튼 순서와 디자인 설정
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined), label: "chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "my"),
        ],
      ),
    );
  }
}
