import 'package:flutter/material.dart';

class MysellerPromotionAddScreen extends StatefulWidget {
  const MysellerPromotionAddScreen({super.key});

  @override
  State<MysellerPromotionAddScreen> createState() =>
      _MysellerPromotionAddScreenState();
}

class _MysellerPromotionAddScreenState
    extends State<MysellerPromotionAddScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 내리기
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("홍보글 작성"),
          actions: [
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "완료",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(children: [
            myTextField("제목입력", 1),
            const SizedBox(height: 10),
            myTextField("홍보내용", 5),
          ]),
        )),
      ),
    );
  }

  Widget myTextField(String text, int lines) {
    return SizedBox(
      child: TextField(
        maxLines: lines,
        decoration: InputDecoration(
            hintText: text,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(10)),
      ),
    );
  }
}
