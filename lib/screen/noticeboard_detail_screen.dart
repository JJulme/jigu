import 'package:flutter/material.dart';

class NoticeboardDetailScreen extends StatefulWidget {
  const NoticeboardDetailScreen({super.key});

  @override
  State<NoticeboardDetailScreen> createState() =>
      _NoticeboardDetailScreenState();
}

class _NoticeboardDetailScreenState extends State<NoticeboardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.green[50],
              child: const Text(
                "홍보글의 내용과 간단한 작성자 정보",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
