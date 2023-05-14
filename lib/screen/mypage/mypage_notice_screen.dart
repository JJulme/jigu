import 'package:flutter/material.dart';

class MypageNoticeScreen extends StatefulWidget {
  const MypageNoticeScreen({super.key});

  @override
  State<MypageNoticeScreen> createState() => _MypageNoticeScreenState();
}

class _MypageNoticeScreenState extends State<MypageNoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 여백 설정 - 없애버림
        titleSpacing: 0,
        title: const Text("알림"),
      ),
    );
  }
}
