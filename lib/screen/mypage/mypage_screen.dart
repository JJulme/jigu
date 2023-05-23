import 'package:flutter/material.dart';
import 'package:jigu/screen/mypage/mypage_modify_screen.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          //항목 세로 간격 설정
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //항목 왼쪽 정렬
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //프로필 사진이 들어갈 자리
                    Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: const Center(child: Text("프사")),
                    ),
                    const SizedBox(width: 10),
                    //닉네임, 주소 자리
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("닉네임",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        SizedBox(height: 5),
                        Text("해운대구 중동", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
                //프로필 수정 자리
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MypageModifyScreen(),
                        ));
                  },
                  child: const Text(
                    "프로필 수정",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
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
            mypageRouter(context, "나의 질문", const MypageQuestionScreen()),
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

  //보여지는 텍스트와 넘어가는 화면 설정해주는 함수
  InkWell mypageRouter(BuildContext context, String text, dynamic pageroute) {
    return InkWell(
        //누르면 페이지 이동
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pageroute,
              ));
        },
        //보여지는 텍스트
        child: Text(text, style: const TextStyle(fontSize: 20)));
  }
}
