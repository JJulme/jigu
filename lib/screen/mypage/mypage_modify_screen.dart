import 'package:flutter/material.dart';

class MypageModifyScreen extends StatefulWidget {
  const MypageModifyScreen({super.key});

  @override
  State<MypageModifyScreen> createState() => _MypageModifyScreenState();
}

class _MypageModifyScreenState extends State<MypageModifyScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          //타이틀 여백 설정 - 없애버림
          titleSpacing: 0,
          title: const Text("프로필 수정"),
          actions: [
            //완료 버튼
            ElevatedButton(
              onPressed: () {},
              //버튼 입체감 없애기
              style: ElevatedButton.styleFrom(elevation: 0),
              child: const Text(
                "완료",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const Center(child: Text("프사변경")),
              ),
              myTextField('닉네임'),
              const SizedBox(height: 15),
              myTextField("나의 나와바리 설정"),
            ],
          ),
        )),
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
