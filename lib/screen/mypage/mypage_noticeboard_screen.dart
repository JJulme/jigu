import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/noticeboard/noticeboard_detail_screen.dart';

class MypageNoticeboardScreen extends StatelessWidget {
  const MypageNoticeboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("관심 홍보글"),
      ),
      body: InkWell(
        onTap: () => Get.to(() => const NoticeboardDetailScreen()),
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 120,
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 90,
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(child: Text("사진, 없을경우 판매자프사")),
              ),
              //Flexible 텍스트 넘침 방지
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "홍보글 제목이 들어갑니다.",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "안녕하세요 이곳에는 홍보글 내용이 들어갑니다. 보이는 내용은 최대 2줄이고 넘을 경우 나머지는 잘리게 됩니다.",
                      maxLines: 2,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
