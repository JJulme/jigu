import 'package:flutter/material.dart';
import 'package:jigu/screen/noticeboard_detail_screen.dart';

class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("홍보글 게시판"),
        actions: [
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "지역설정",
                style: TextStyle(color: Colors.white),
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NoticeboardDetailScreen()),
          );
        },
        child: ListView(
          children: [
            Container(
              color: Colors.blue.shade100,
              height: 100,
              child: const Center(child: Text("정현진")),
            ),
            Container(
              color: Colors.blue.shade200,
              height: 100,
              child: const Center(child: Text("임정민")),
            ),
            Container(
              color: Colors.blue.shade300,
              height: 100,
              child: const Center(child: Text("김광호")),
            ),
            Container(
              color: Colors.blue.shade400,
              height: 100,
              child: const Center(child: Text("김기환")),
            ),
            Container(
              color: Colors.blue.shade100,
              height: 100,
              child: const Center(child: Text("정현진")),
            ),
            Container(
              color: Colors.blue.shade200,
              height: 100,
              child: const Center(child: Text("임정민")),
            ),
            Container(
              color: Colors.blue.shade300,
              height: 100,
              child: const Center(child: Text("김광호")),
            ),
            Container(
              color: Colors.blue.shade400,
              height: 100,
              child: const Center(child: Text("김기환")),
            ),
          ],
        ),
      ),
    );
  }
}
