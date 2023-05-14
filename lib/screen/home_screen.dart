import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jigu/screen/mypage/mypage_screen.dart';
import 'package:jigu/screen/seek/seek_screen.dart';
import 'chat/chat_screen.dart';
import 'noticeboard/noticeboard_screen.dart';

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
    const NoticeboardScreen(),
    const SeekScreen(),
    const ChatScreen(),
    const MypageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 인덱스에 따라 바뀌는 화면 설정
      body: bodyScreen.elementAt(currentindex),
      bottomNavigationBar: BottomNavigationBar(
        //버튼 누를시 효과 고정으로 설정 - 안하면 버튼이 안보이는 버그
        type: BottomNavigationBarType.fixed,
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
              icon: Icon(Icons.home_outlined), label: "팔아요"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new), label: "찾아요"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: "채팅"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "내정보"),
        ],
      ),
    );
  }
}
