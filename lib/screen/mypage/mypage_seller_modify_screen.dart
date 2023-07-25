import 'package:flutter/material.dart';

class MypageSellerModifyScreen extends StatefulWidget {
  const MypageSellerModifyScreen({super.key});

  @override
  State<MypageSellerModifyScreen> createState() =>
      _MypageSellerModifyScreenState();
}

class _MypageSellerModifyScreenState extends State<MypageSellerModifyScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          //타이틀 여백 설정 - 없애버림
          titleSpacing: 0,
          title: const Text("매장 정보 수정"),
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
            child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Center(child: Text("프사변경")),
                ),
                myTextField('매장명'),
                const SizedBox(height: 15),
                myTextField('운영시간'),
                const SizedBox(height: 15),
                myTextField('연락처'),
                const SizedBox(height: 15),
                //주차장,
                myTextField('기타 선택 해시태그'),
                const SizedBox(height: 15),
                myTextField('소개글'),
                const SizedBox(height: 15),
              ],
            ),
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
