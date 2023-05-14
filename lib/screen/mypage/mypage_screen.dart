import 'package:flutter/material.dart';
import 'package:jigu/screen/mypage/mypage_notice_screen.dart';
import 'package:jigu/screen/mypage/mypage_question_screen.dart';
import 'package:jigu/screen/mypage/mypage_setting_screen.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //알림 목록 볼 수 있는 버튼
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MypageNoticeScreen(),
                    ));
              },
              icon: const Icon(Icons.notifications)),
          //환경설정할 수 있는 버튼
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MypageSettingScreen(),
                    ));
              },
              icon: const Icon(Icons.settings))
        ],
        title: const Text("마이페이지"),
      ),
      //UI 보호해주는 클래스
      body: SafeArea(
          child: Container(
        //내부 여백 설정하기
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          //항목 세로 간격 설정
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //항목 왼쪽 정렬
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //프로필 사진이 들어갈 자리
                    Icon(
                      Icons.person,
                      size: 100,
                    ),
                    //닉네임 자리
                    Text(
                      "닉네임",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                //프로필 수정하는 자리
                Text(
                  "프로필 수정",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
            //나의 활동
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 1.0),
            const SizedBox(height: 20),
            const Text("나의 활동",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            mypageRouter(context),
            const Text("나의 답변", style: TextStyle(fontSize: 20)),
            //관심목록
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 1.0),
            const SizedBox(height: 20),
            const Text("관심목록",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text("홍보글", style: TextStyle(fontSize: 20)),
            const Text("판매자", style: TextStyle(fontSize: 20)),
            //고객센터
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 1.0),
            const SizedBox(height: 20),
            const Text("고객센터",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text("문의하기", style: TextStyle(fontSize: 20)),
            const Text("공지사항", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }

  InkWell mypageRouter(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MypageQuestionScreen(),
              ));
        },
        child: const Text("나의 질문", style: TextStyle(fontSize: 20)));
  }
}
