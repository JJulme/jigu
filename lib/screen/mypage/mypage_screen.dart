import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/login/login_screen.dart';
import 'package:jigu/screen/mypage/mypage_modify_screen.dart';
import 'package:jigu/screen/mypage/mypage_notice_screen.dart';
import 'package:jigu/screen/mypage/mypage_question_screen.dart';
import 'package:jigu/screen/mypage/mypage_setting_screen.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  bool common = true;

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
          child: SingleChildScrollView(
        child: Container(
          //내부 여백 설정하기
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            //항목 왼쪽 정렬
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //일반계정 프로필 정보

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
              OutlinedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text("Login")),
            ],
          ),
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

  //일반프로필 설정
  Widget commonProfile() {
    return Row(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("닉네임",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                const Text("해운대구 중동", style: TextStyle(fontSize: 15)),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        common != common;
                      });
                    },
                    child: const Text("사업자 전환")),
              ],
            ),
          ],
        ),
        //프로필 수정 자리
        TextButton(
          onPressed: () {
            Get.to(() => const MypageModifyScreen());
          },
          child: const Text(
            "프로필 수정",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  //사업자프로필 설정
  Widget sellerProfile() {
    return Row(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("매장명",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                const Text("해운대구 중동", style: TextStyle(fontSize: 15)),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        common != common;
                      });
                    },
                    child: const Text("사업자 전환")),
              ],
            ),
          ],
        ),
        //프로필 수정 자리
        TextButton(
          onPressed: () {
            Get.to(() => const MypageModifyScreen());
          },
          child: const Text(
            "프로필 수정",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
