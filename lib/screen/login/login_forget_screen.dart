import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jigu/screen/login/login_findid_screen.dart';
import 'package:jigu/screen/login/login_findpw_screen.dart';

class LoginForgetScreen extends StatefulWidget {
  const LoginForgetScreen({super.key});

  @override
  State<LoginForgetScreen> createState() => _LoginForgetScreenState();
}

class _LoginForgetScreenState extends State<LoginForgetScreen>
    with TickerProviderStateMixin {
  final forgetTabs = <Tab>[
    const Tab(text: "아이디 찾기"),
    const Tab(text: "비밀번호 찾기"),
  ];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: forgetTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("아이디 / 비밀번호 찾기")),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            TabBar(
              tabs: forgetTabs,
              controller: _tabController,
              //탭바 스타일 설정
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w100, fontSize: 15),
            ),
            //Expanded 필수
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  tabForgetId(),
                  tabForgetPassward(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget tabForgetId() {
    //SingleChildScrollView 필수 - 없으면 에러남
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: ExpansionPanelList.radio(
          children: [
            ExpansionPanelRadio(
                canTapOnHeader: true,
                value: const Text("휴대전화번호로 찾기"),
                headerBuilder: (context, isExpanded) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      "휴대전화번호로 찾기",
                      style: TextStyle(fontSize: 20),
                    )),
                body: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: myTextField("휴대전화번호 입력")),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("인증번호")),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    myTextField("인증번호 입력"),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.off(() => const LoginFindIdScreen());
                            },
                            child: const Text(
                              "확 인",
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                )),
            ExpansionPanelRadio(
                canTapOnHeader: true,
                value: const Text("이메일로 찾기"),
                headerBuilder: (context, isExpanded) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      "이메일로 찾기",
                      style: TextStyle(fontSize: 20),
                    )),
                body: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: myTextField("이메일 입력")),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("인증번호")),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    myTextField("인증번호 입력"),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.off(() => const LoginFindIdScreen());
                            },
                            child: const Text(
                              "확 인",
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget tabForgetPassward() {
    //SingleChildScrollView 필수 - 없으면 에러남
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: ExpansionPanelList.radio(
          children: [
            ExpansionPanelRadio(
                canTapOnHeader: true,
                value: const Text("휴대전화번호로 찾기"),
                headerBuilder: (context, isExpanded) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      "휴대전화번호로 찾기",
                      style: TextStyle(fontSize: 20),
                    )),
                body: Column(
                  children: [
                    myTextField("아이디 입력"),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: myTextField("휴대전화번호 입력")),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("인증번호")),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    myTextField("인증번호 입력"),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.off(() => const LoginFindPwScreen());
                            },
                            child: const Text(
                              "확 인",
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                )),
            ExpansionPanelRadio(
                canTapOnHeader: true,
                value: const Text("이메일로 찾기"),
                headerBuilder: (context, isExpanded) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      "이메일로 찾기",
                      style: TextStyle(fontSize: 20),
                    )),
                body: Column(
                  children: [
                    myTextField("아이디 입력"),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: myTextField("이메일 입력")),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("인증번호")),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    myTextField("인증번호 입력"),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.off(() => const LoginFindPwScreen());
                            },
                            child: const Text(
                              "확 인",
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget myTextField(String text) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
