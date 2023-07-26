import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/mypage/myseller/myseller_promotion_add_screen.dart';
import 'package:jigu/screen/mypage/myseller/myseller_promotion_detail_screen.dart';

class MysellerPromotionScreen extends StatefulWidget {
  const MysellerPromotionScreen({super.key});

  @override
  State<MysellerPromotionScreen> createState() =>
      _MysellerPromotionScreenState();
}

class _MysellerPromotionScreenState extends State<MysellerPromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("매장 홍보글 목록"),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const MysellerPromotionAddScreen()),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [sellerNews("ddd")],
      )),
    );
  }

  Widget sellerNews(String text) {
    return InkWell(
      onTap: () => Get.to(() => const MysellerPromotionDetailScreen()),
      child: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.indigo[100],
        height: 120,
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }
}
