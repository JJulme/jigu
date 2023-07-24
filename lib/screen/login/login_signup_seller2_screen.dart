import 'package:flutter/material.dart';

class LoginSignupSeller2Screen extends StatefulWidget {
  const LoginSignupSeller2Screen({super.key});

  @override
  State<LoginSignupSeller2Screen> createState() =>
      _LoginSignupSeller2ScreenState();
}

class _LoginSignupSeller2ScreenState extends State<LoginSignupSeller2Screen> {
  final double boxMargin = 25;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("매장 정보 입력")),
        body: SafeArea(
          child: Form(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          myTextField("상호명"),
                          SizedBox(height: boxMargin),
                          myTextField("영업시간"),
                          SizedBox(height: boxMargin),
                          //카테고리 검색 버튼 띄워야 함
                          myTextField("카테고리 선택"),
                          SizedBox(height: boxMargin),
                          myTextField("연락처1"),
                          SizedBox(height: boxMargin),
                          myTextField("연락처2"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          Container(
            height: 68,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "다 음",
                  style: TextStyle(fontSize: 23),
                )),
          )
        ],
      ),
    );
  }

  Widget myTextField(String text) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
