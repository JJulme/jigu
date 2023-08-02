import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/mypage/mypage_answer_detail_screen.dart';

class MypageAnswerScreen extends StatefulWidget {
  const MypageAnswerScreen({super.key});

  @override
  State<MypageAnswerScreen> createState() => _MypageAnswerScreenState();
}

class _MypageAnswerScreenState extends State<MypageAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 답변"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          myAnswer("", const MypageAnswerDetailScreen()),
          myAnswer("", const MypageAnswerDetailScreen()),
        ],
      )),
    );
  }

  Widget myAnswer(String text, dynamic page) {
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
                        "내가 답변한 내용이 들어가게 됩니다. 보이는 내용은 최대 2줄이고 넘을 경우 잘리게 됩니다.",
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
