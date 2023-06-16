import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/noticeboard/noticeboard_expansiontile_screen.dart';
import 'package:jigu/screen/noticeboard/noticeboard_kategorie_screen.dart';
import 'package:jigu/screen/search/search_screen.dart';
import 'noticeboard_detail_screen.dart';

class NoticeboardScreen extends StatefulWidget {
  const NoticeboardScreen({super.key});

  @override
  State<NoticeboardScreen> createState() => _NoticeboardScreenState();
}

class _NoticeboardScreenState extends State<NoticeboardScreen> {
  //lib\screen\noticeboard\noticeboard_kategorie_screen.dart 에서 데이터 받는 변수
  late dynamic selectKategorie = Get.arguments;

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
              Get.to(() => const NoticeboardKategorieScreen());
            },
            //버튼 입체감 없애기
            style: ElevatedButton.styleFrom(elevation: 0),
            //텍스트 설정
            child: Text(
              //받은 데이터가 비어있으면 "카테고리", 선택되었다면 선택된 카테고리 이름
              (selectKategorie == null) ? "카테고리" : selectKategorie,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const NoticeboardExpantiontileScreen());
            },
            //버튼 입체감 없애기
            style: ElevatedButton.styleFrom(elevation: 0),
            //텍스트 설정
            child: const Text(
              "지역설정",
              style: TextStyle(color: Colors.white, fontSize: 17),
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
              color: Colors.indigo.shade100,
              height: 100,
              child: const Center(child: Text("정현진")),
            ),
            Container(
              color: Colors.indigo.shade200,
              height: 100,
              child: const Center(child: Text("임정민")),
            ),
            Container(
              color: Colors.indigo.shade300,
              height: 100,
              child: const Center(child: Text("김광호")),
            ),
            Container(
              color: Colors.indigo.shade400,
              height: 100,
              child: const Center(child: Text("김기환")),
            ),
            Container(
              color: Colors.indigo.shade100,
              height: 100,
              child: const Center(child: Text("정현진")),
            ),
            Container(
              color: Colors.indigo.shade200,
              height: 100,
              child: const Center(child: Text("임정민")),
            ),
            Container(
              color: Colors.indigo.shade300,
              height: 100,
              child: const Center(child: Text("김광호")),
            ),
            Container(
              color: Colors.indigo.shade400,
              height: 100,
              child: const Center(child: Text("김기환")),
            ),
          ],
        ),
      ),
    );
  }
}
