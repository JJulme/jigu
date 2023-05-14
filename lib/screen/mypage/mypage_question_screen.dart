import 'package:flutter/material.dart';

class MypageQuestionScreen extends StatefulWidget {
  const MypageQuestionScreen({super.key});

  @override
  State<MypageQuestionScreen> createState() => _MypageQuestionScreenState();
}

class _MypageQuestionScreenState extends State<MypageQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 여백 설정 - 없애버림
        titleSpacing: 0,
        title: const Text("나의 질문"),
      ),
    );
  }
}
