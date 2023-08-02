import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/mypage/mypage_question_detail_screen.dart';

class MypageQuestionScreen extends StatefulWidget {
  const MypageQuestionScreen({super.key});

  @override
  State<MypageQuestionScreen> createState() => _MypageQuestionScreenState();
}

class _MypageQuestionScreenState extends State<MypageQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 여백 설정 - 없애버림
        titleSpacing: 0,
        title: const Text("나의 질문"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          myQuestions("답변횟수", const MypageQuestionDetailScreen()),
          myQuestions("2개의 답변", const MypageQuestionDetailScreen())
        ],
      )),
    );
  }

  Widget myQuestions(String text, dynamic page) {
    return InkWell(
      onTap: () => Get.to(page),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        decoration: BoxDecoration(border: Border.all()),
        height: 140,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(child: Text("사진, 없을경우 질문자프사")),
                ),
                //Flexible 텍스트 넘침 방지
                const Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "찾는글 제목이 들어갑니다.",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "내가 질문한 내용이 들어가게 됩니다. 보이는 내용은 최대 2줄이고 넘을 경우 잘리게 됩니다.",
                        maxLines: 2,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(text),
            )
          ],
        ),
      ),
    );
  }
}
