import 'package:flutter/material.dart';

class MysellerPromotionDetailScreen extends StatefulWidget {
  const MysellerPromotionDetailScreen({super.key});

  @override
  State<MysellerPromotionDetailScreen> createState() =>
      _MysellerPromotionDetailScreenState();
}

class _MysellerPromotionDetailScreenState
    extends State<MysellerPromotionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("홍보글 제목"),
        actions: [
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "수정",
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "삭제",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),

            //본문 내용
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "제목 작성",
                  style: TextStyle(fontSize: 50),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Text(
                  "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세",
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
