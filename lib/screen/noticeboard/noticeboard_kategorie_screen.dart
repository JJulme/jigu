import 'package:flutter/material.dart';

class NoticeboardKategorieScreen extends StatefulWidget {
  const NoticeboardKategorieScreen({super.key});

  @override
  State<NoticeboardKategorieScreen> createState() =>
      _NoticeboardKategorieScreenState();
}

class _NoticeboardKategorieScreenState
    extends State<NoticeboardKategorieScreen> {
  //대분류 카테고리
  List<String> mainKategorie = ["음식점", "마트/편의점", "카페/디저트"];
  //소분류 음식점
  List<String> foodKategorie = [
    "고기집",
    "한식",
    "중식",
    "양식",
    "아시안",
    "패스트푸드",
    "이자카야"
  ];
  @override
  Widget build(BuildContext context) {
    //대분류의 개수반환
    int mainIndex = mainKategorie.length;
    //대분류 개수에 맞게 bool 리스트 생성
    List<bool> isPanal = List.generate(mainIndex, (_) => false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                //ExpansionPanal 설명 유튜브 https://www.youtube.com/watch?v=2aJZzRMziJc
                child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) => setState(() {
                    isPanal[panelIndex] = !isExpanded;
                  }),
                  children: [
                    for (var i in mainKategorie)
                      ExpansionPanel(
                        //대분류의 이름이 들어갈 패널이름
                        headerBuilder: (context, isOpened) =>
                            Center(child: Text(i)),

                        body: const Text("Open"),
                        isExpanded: isPanal[0],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
