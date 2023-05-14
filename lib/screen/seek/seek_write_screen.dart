import 'package:flutter/material.dart';

class SeekWriteScreen extends StatefulWidget {
  const SeekWriteScreen({super.key});

  @override
  State<SeekWriteScreen> createState() => _SeekWriteScreenState();
}

class _SeekWriteScreenState extends State<SeekWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //타이틀 여백 설정 - 없애버림
        titleSpacing: 0,
        title: const Text("찾아요 글 작성하기"),
      ),
    );
  }
}
