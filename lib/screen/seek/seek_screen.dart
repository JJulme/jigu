import 'package:flutter/material.dart';
import 'package:jigu/screen/search/search_screen.dart';
import 'package:jigu/screen/seek/seek_write_screen.dart';

class SeekScreen extends StatelessWidget {
  const SeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("찾아요"),
        actions: [
          //검색버튼
          IconButton(
              //누르면 화면 이동
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search)),
          PopupMenuButton(
            //PopupMenuItem onTap 사용안하고 작동 방법
            //https://github.com/flutter/flutter/issues/81682
            itemBuilder: (context) => [
              const PopupMenuItem(value: 0, child: Text("작성한글")),
              const PopupMenuItem(value: 1, child: Text("작성하기")),
            ],
            onSelected: (choice) {
              switch (choice) {
                //작성한글
                case 0:
                  break;
                //작성하기
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SeekWriteScreen()),
                  );
              }
            },
          )
        ],
      ),
      body: GestureDetector(
        //홍보글을 누르면 해당 상세내용으로 넘어감
        onTap: () {},
        child: ListView(
          children: [
            Container(
              color: Colors.blue.shade100,
              height: 100,
              child: const Center(child: Text("카네이션 파는 꽃집 찾아요.")),
            ),
            Container(
              color: Colors.blue.shade200,
              height: 100,
              child: const Center(child: Text("관악구 명이나물 나오는 고기집 찾아요.")),
            ),
            Container(
              color: Colors.blue.shade300,
              height: 100,
              child: const Center(child: Text("신림동 빵집 선반제작 업체 찾아요.")),
            ),
            Container(
              color: Colors.blue.shade400,
              height: 100,
              child: const Center(child: Text("포토카드 출력할 수 있는곳 찾아요.")),
            ),
            Container(
              color: Colors.blue.shade100,
              height: 100,
              child: const Center(child: Text("말통 판매하는 철물점 찾아요.")),
            ),
            Container(
              color: Colors.blue.shade200,
              height: 100,
              child: const Center(child: Text("서울에서 경기도 용인까지 퀵가능한 업체 찾습니다.")),
            ),
            Container(
              color: Colors.blue.shade300,
              height: 100,
              child: const Center(child: Text("오늘 점심 뭐먹어요?")),
            )
          ],
        ),
      ),
    );
  }
}
