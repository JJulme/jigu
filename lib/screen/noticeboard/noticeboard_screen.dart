import 'package:flutter/material.dart';
import 'package:jigu/screen/noticeboard/noticeboard_kategorie_screen.dart';
import 'package:jigu/screen/search/search_screen.dart';
import 'noticeboard_detail_screen.dart';

class NoticeboardScreen extends StatelessWidget {
  const NoticeboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("팔아요"),
        actions: [
          //카테고리 버튼 설정
          ElevatedButton(
            //카테고리 버튼 누르면 화면 전환
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoticeboardKategorieScreen(),
                  ));
            },
            //카테고리 텍스트 설정
            child: const Text(
              "카테고리",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "지역설정",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //검색화면에 검색과 토글버튼 생성 예정
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: GestureDetector(
        //홍보글을 누르면 해당 상세내용으로 넘어감
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
