import 'package:flutter/material.dart';

class MysellerNewsScreen extends StatefulWidget {
  const MysellerNewsScreen({super.key});

  @override
  State<MysellerNewsScreen> createState() => _MysellerNewsScreenState();
}

class _MysellerNewsScreenState extends State<MysellerNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("매장 소식 관리"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            sellerNews("추석에 정상영업 합니다!"),
            const SizedBox(height: 10),
            sellerNews("8월 1일 개인사정으로 휴무입니다."),
          ],
        ),
      )),
    );
  }

  Widget sellerNews(String text) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            const Text("23.07.05")
          ],
        ),
      ),
    );
  }
}
