import 'package:flutter/material.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen>
    with TickerProviderStateMixin {
  //탭 목록
  final sellerTabs = <Tab>[
    const Tab(text: "소개"),
    const Tab(text: "알림"),
    const Tab(text: "홍보글"),
    const Tab(text: "답변"),
  ];
  //탭 컨트롤러 설정
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: sellerTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text("사진"),
              ),
              const SizedBox(height: 15),
              const Text(
                "세븐일레븐 부산수영푸른빌점",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text("<마트/편의점>",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              const Divider(thickness: 2, height: 50),
              iconText("부산 수영구 망미번영로16번길 74", const Icon(Icons.room_outlined)),
              iconText("010-8285-3283", const Icon(Icons.phone)),
              iconText("주차 불가", const Icon(Icons.local_parking)),
              iconText("이용시간", const Icon(Icons.access_time)),
              const Divider(thickness: 2, height: 50),
              TabBar(
                tabs: sellerTabs,
                controller: _tabController,
                //탭바 스타일 설정
                labelColor: Colors.black,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w100, fontSize: 15),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: const Text("스크롤 이슈"),
              ),
            ],
          ),
        ),
      )),
    );
  }

  //아이콘, 텍스트 입력 위젯
  Widget iconText(String text, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
