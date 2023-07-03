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
  //선택하는 값 초기화
  var selectKategorie = "";
  //카테고리, 지역설정에서 데이터 받는 함수
  selcetValue(dynamic value, String text) {
    if (value == "") {
      return text;
    }
    return value;
  }

  var notices = ["정현진", "임정민", "김광호", "김기환", "정현진", "임정민", "김광호", "김기환"];
  var colorCode = [100, 300, 400, 500, 100, 300, 400, 500];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("팔아요"),
        actions: [
          //이 버튼 만드는데 3일 걸림
          //카테고리 버튼 설정
          ElevatedButton(
            //카테고리 버튼 누르면 화면 전환
            onPressed: () async {
              //선택할 경우
              try {
                selectKategorie =
                    await Get.to(() => const NoticeboardKategorieScreen());
                //선택안하고 돌아올경우
              } catch (e) {
                selectKategorie = selectKategorie;
              }
              setState(() {});
            },
            //버튼 입체감 없애기
            style: ElevatedButton.styleFrom(elevation: 0),
            //텍스트 설정
            child: Text(
              selcetValue(selectKategorie, "카테고리"),
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
            Get.to(() => const NoticeboardDetailScreen());
          },
          child: ListView.builder(
            itemCount: notices.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                height: 120,
                color: Colors.indigo[colorCode[index]],
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
              );
            },
          )),
    );
  }
}
