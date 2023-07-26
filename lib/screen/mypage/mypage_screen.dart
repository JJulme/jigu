import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/login/login_screen.dart';
import 'package:jigu/screen/mypage/mypage_common_modify_screen.dart';
import 'package:jigu/screen/mypage/mypage_notice_screen.dart';
import 'package:jigu/screen/mypage/mypage_question_screen.dart';
import 'package:jigu/screen/mypage/mypage_setting_screen.dart';
import 'package:jigu/screen/mypage/myseller/myseller_answer_screen.dart';
import 'package:jigu/screen/mypage/myseller/myseller_modify_screen.dart';
import 'package:jigu/screen/mypage/myseller/myseller_news_screen.dart';
import 'package:jigu/screen/mypage/myseller/myseller_promotion_screen.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  var common = true;

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
              SizedBox(child: common ? commonProfile() : sellerProfile()),
              //고객센터
              const Divider(color: Colors.grey, thickness: 1.0, height: 35),
              const Text("고객센터",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              mypageRouter("문의하기", const MypageQuestionScreen()),
              mypageRouter("공지사항", const MypageQuestionScreen()),
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
  InkWell mypageRouter(String text, dynamic pageroute) {
    return InkWell(
      //누르면 페이지 이동
      onTap: () {
        //Get.to(()=>pageroute); 로 작성하면 오류 발생, 이유모름
        Get.to(pageroute);
      },
      //보여지는 텍스트
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Text(text, style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  //일반프로필 설정
  Widget commonProfile() {
    return Column(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("닉네임",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    const Text("서울 신림동", style: TextStyle(fontSize: 15)),
                    //사업자로 바뀌는 버튼
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            common = !common;
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
                Get.to(() => const MypageCommonModifyScreen());
              },
              child: const Text(
                "프로필 수정",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
          ],
        ),
        //나의 활동
        const Divider(color: Colors.grey, thickness: 1.0, height: 35),
        const Text("나의 활동",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        mypageRouter("나의 질문", const MypageQuestionScreen()),
        mypageRouter("나의 답변", const MypageQuestionScreen()),
        //관심목록
        const Divider(color: Colors.grey, thickness: 1.0, height: 35),
        const Text("관심목록",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        mypageRouter("홍보글", const MypageQuestionScreen()),
        mypageRouter("판매자", const MypageQuestionScreen()),
      ],
    );
  }

  //사업자프로필 설정
  Widget sellerProfile() {
    return Column(
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
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Center(child: Text("프사")),
                ),
                const SizedBox(width: 10),
                //닉네임, 주소 자리
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("세븐일레븐",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    const Text("해운대구 중동", style: TextStyle(fontSize: 15)),
                    //일반 계정으로 바뀌는 버튼
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            common = !common;
                          });
                        },
                        child: const Text("일반 전환")),
                  ],
                ),
              ],
            ),
            //프로필 수정 자리
            TextButton(
              onPressed: () {
                Get.to(() => const MysellerModifyScreen());
              },
              child: const Text(
                "매장 정보 수정",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 1.0, height: 35),
        const Text("매장 관리",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        mypageRouter("매장 소식", const MysellerNewsScreen()),
        mypageRouter("매장 홍보글", const MysellerPromotionScreen()),
        mypageRouter("매장 답변", const MysellerAnswerScreen()),
      ],
    );
  }
}
