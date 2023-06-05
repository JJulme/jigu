import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TextField 컨트롤러 선언
  final TextEditingController _controller = TextEditingController();
  //Tab 페이지 설정
  final List<Tab> searchTabs = <Tab>[
    const Tab(text: "팔아요"),
    const Tab(text: "찾아요"),
    const Tab(text: "판매자"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: searchTabs.length,
      child: GestureDetector(
        //키보드 내리기
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            //title 가운데 설정 해제 - 왼쪽 정렬 됨
            centerTitle: false,
            //뒤로가기 버튼 생성
            automaticallyImplyLeading: true,
            //Appbar title 여백 제거 설정
            titleSpacing: 0,
            //검색어 박스 모양 설정을 위한 컨테이너 박스
            title: Container(
              //Container 외부 간격 조정
              margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: TextField(
                //컨트롤러
                controller: _controller,
                //TextField 꾸미기
                decoration: InputDecoration(
                  //채우기 색상 설정
                  filled: true,
                  fillColor: Colors.blue[50],
                  //테두리 둥글게 설정
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  //내부 여백 간격 설정
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  //입력전 힌트 설정
                  hintText: "검색어를 입력하세요",
                  //텍스트 한번에 지우는 버튼 설정
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          onPressed: () => _controller.clear(),
                          icon: const Icon(
                            Icons.cancel_sharp,
                            size: 20,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            bottom: TabBar(tabs: searchTabs),
          ),
          body: SafeArea(
            child: TabBarView(
              children: searchTabs.map(
                (Tab tab) {
                  final String? label = tab.text;
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.blue[100]),
                    child: Center(
                      child: Text(
                        "검색 결과가 나올 $label 목록",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
